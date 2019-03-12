# dotfiles
# My faves in dotfiles
 vi ~/.bash_aliases
 vi ~/.functions

# Alias definitions.
grep 'bash_aliases' ~/.bash*  # check if it is in there...

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# add this to your .bashrc

# ~/.bash_aliases ...
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ~/.functions too ...
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# THEN: - just download them with wget
if [ -f ~/.bash_aliases ]; then
    mv ~/.bash_aliases ~/.bash_aliases.original
    cd ~
    wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.bash_aliases
fi

if [ -f ~/.bash_logout ]; then
    mv ~/.bash_logout ~/.bash_logout.original
    cd ~
    wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.bash_logout
fi

if [ -f ~/.functions ]; then
    mv ~/.functions ~/.functions.original
    cd ~
    wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.functions
fi

wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.bash_aliases
wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.functions
wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.bash_logout
. ~/.bashrc

sed -i '/^#/d'  ~/.history        # Remove all lines starting with '#'
sed -i '/CAlist/d'  ~/.history    # Remove any line with 'CAlist'
