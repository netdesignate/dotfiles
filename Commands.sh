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
# ~/.functions is pulled into ~/.bash_aliases ...

# THEN: - just download them with wget
if [ -f ~/.bash_aliases ]; then
    mv ~/.bash_aliases ~/.bash_aliases.original
    cd ~
    wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.bash_aliases
fi
# ~/.bash_aliases ...
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

cd ~; rm -rf ~/.bash_aliases* ~/.functions* ~/.bash_logout*
wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.bash_aliases
wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.functions
wget https://raw.githubusercontent.com/netdesignate/dotfiles/master/.bash_logout
. ~/.bashrc

# great cmd below to export (from powershell) full date time stamps into a csv for display in excel.
Get-ChildItem c:\pic\folder -Force | Select-Object FullName, CreationTime, LastAccessTime, LastWriteTime, Mode, Length | Export-Csv c:\path\file.csv

# Count the number of [e.g. Commas] in each line of a file:
 grep -n -o ','  FileName|sort -n | uniq -c | cut -d : -f 1 | head
 
sed -i 's/old/new/g' input.txt # replace all occurrences in the file...
sed -i '/^#/d'  ~/.history     # Remove all lines starting with '#'
sed -r '/^\s*$/d'              # Remove all "empty" lines (no Chars, whitespace ok)
sed -i '/CAlist/d'  ~/.history # Remove any line that contains 'CAlist'
sed -i '/^.\{,20\}$/d' fname   # Delete lines shorter than 20 Characters
sed 's/x//g'                   # Remove 'x' from input...
sed "/str1/,/str2/d" file      # remove ALL lines between str1/2 - including lines where strx is found
sed -n '/^SomeString/,$p'      # Removes all lines until a match (excludes the match)
sed '1,9!d' file.name          # prints only lines 1 thru 9 from file.name to stdout
sed -n -e 5,8p -e 10p file     # To print range with other specific line (e.g. 5-8 & 10)
sed 's/^ *//g'                 # remove leading spaces (any count)
${var:(-3)} or ${var: -3}      # https://stackoverflow.com/questions/19858600/accessing-last-x-characters-of-a-string-in-bash
