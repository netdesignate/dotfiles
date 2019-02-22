# dotfiles
# My faves in dotfiles
 vi ~/.bash_aliases
 vi ~/.functions

# Alias definitions.
grep 'bash_aliases' ~/.bash*  # check if it is in there...

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# add this to your .bashrc

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# THEN: - just download them with wget
wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.bash_aliases
wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.functions
. ~/.bashrc
