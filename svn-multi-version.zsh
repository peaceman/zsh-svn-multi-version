# vim:ft=zsh ts=2 sw=2 sts=2
#
local svn_old=/usr/bin/svn
local svn_new=/usr/local/bin/svn
local svn_cli=$svn_new

alias svn=_svn_wrapper

function _svn_wrapper() {
    svn_to_use=$svn_cli
    
    if _current_dir_is_svn_repo; then
        if _has_old_repo_format; then
            svn_to_use=$svn_old
        fi
    fi
    
    $svn_to_use "$@"
}

function _has_old_repo_format() {
    if $($svn_cli info 2>&1 | grep E155036 > /dev/null); then
        return 0
    fi
    return 1
}

function _current_dir_is_svn_repo() {
    if $($svn_cli info 2>&1 | grep E155007 > /dev/null); then
        return 1
    fi
    return 0
}