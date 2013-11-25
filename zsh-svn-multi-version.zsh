# vim:ft=zsh ts=2 sw=2 sts=2
#
local msg='You have to define a list of available svn binaries ($SVN_BINARIES) for zsh-svn-multi-version'
if (( ! $+SVN_BINARIES )); then
    echo $msg
    return 1
fi

alias svn=_svn_wrapper

function _svn_wrapper() {
    local current_svn_binary_index=1
    local svn_to_use=$SVN_BINARIES[$current_svn_binary_index]
    
    if _current_dir_is_svn_repo $svn_to_use; then
        while _has_old_repo_format $svn_to_use; do
            let "current_svn_binary_index++"
            svn_to_use=$SVN_BINARIES[$current_svn_binary_index]
        done
    fi
    
    $svn_to_use "$@"
}

function _has_old_repo_format() {
    local svn_cli=$1
    if $($svn_cli info 2>&1 | grep E155036 > /dev/null); then
        return 0
    fi
    return 1
}

function _current_dir_is_svn_repo() {
    local svn_cli=$1
    if $($svn_cli info 2>&1 | grep E155007 > /dev/null); then
        return 1
    fi
    return 0
}