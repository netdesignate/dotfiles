# dotfiles
# My faves in dotfiles
 vi ~/.bash_aliases
 vi ~/.functions
# T510 Ubuntu Backup option --> WD "My Passport"
# /dev/sdb1  /mnt/mypassport   ntfs    user,fmask=0111,dmask=0000   0       0
# 
alias bkp='sudo tar czf \
    /mnt/mypassport/DRM/T510/T510_Backup_$(date +"%Y-%m-%d_%H-%M-%S").tar.gz \
    --exclude=/backup.tar.gz --exclude=/dev --exclude=/mnt --exclude=/proc \
    --exclude=/sys --exclude=/tmp --exclude=/lost+found /'
    
# Alias definitions.
grep 'bash_aliases' ~/.bash*  # check if it is in there...

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# add this to your .bashrc

# ~/.bash_aliases ...
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ey related stuff...
if [ -f ~/.ey_aliases ]; then
    . ~/.ey_aliases
fi

# ~/.functions is pulled into ~/.bash_aliases ...
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

sed -i 's/old/new/g' input.txt  # replace all occurrences in the file...
sed -i '/^#/d'  ~/.history        # Remove all lines starting with '#'
sed -i '/CAlist/d'  ~/.history    # Remove any line with 'CAlist'
sed 's/x//g'                      # Remove 'x' from input...
