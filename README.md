zsh-svn-multi-version
=====================

zsh plugin, that modifies the used svn client binary, based on the repo format version


How to install
--------------

### With [oh-my-zsh] [1]

* Clone this repo into your custom plugin directory

        mkdir -p ~/.oh-my-zsh/custom/plugins && cd ~/.oh-my-zsh/custom/plugins
        git clone https://github.com/peaceman/zsh-svn-multi-version.git
        
* Add `zsh-svn-multi-version` to the plugin list in `~/.zshrc`
* Configure the svn binaries to use in `~/.zshrc`. The list has to be sorted by the svn clients version in descending order.

        SVN_BINARIES=(/usr/local/bin/svn /usr/bin/svn)

* Source `~/.zshrc` or open a new shell to apply the changes

        source ~/.zshrc
        
[1]: https://github.com/robbyrussell/oh-my-zsh
