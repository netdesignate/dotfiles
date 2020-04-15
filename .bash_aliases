# OK Adding a Verion: Bash-Aliases-2020-04-12 [Easter 2020]
alias bkup_cec='mysqldump -u cecLite -p cecLite > cecLite-$(date +%F-%H%M).sql'
alias ls1='find . -mtime 0'
alias rlsp="sed 's/^ *//g'"
alias cd7='cd /var/www/ce7'
alias cd8='cd /var/www/ce8'
alias cdce='cd /var/www/cityethics.org'
alias cdj='cd /var/www/jaxbeachtech.com.d8'
alias cdk='cd /var/www/kunda.com.au'
alias cdcl='cd /var/www/corporateLite'
alias egrep='egrep --color=auto --exclude=*history*'
alias fgrep='fgrep --color=auto --exclude=*history*'
alias grep='grep --color=auto --exclude=*history*'
alias lsd='ls -al | grep ^d'
alias wetail='sudo tail -n 200 /var/log/apache2/error.log | less'
alias wtail='sudo tail -n 200 /var/log/apache2/access.log | less'
alias df='df -h'
alias dir='ls --color=auto --format=vertical'
alias du='du -h'
alias dusum='du -sh * | sort -rh'
alias l='ls -CF'
alias la='ls -la'
alias less='less -r'
alias ll='ls -lahF --color=auto'
alias ls='ls -hF --color=tty'
alias lsd='ls -al | grep ^d'
alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias nonag="sed -i.bak 's/NotFound/Active/g' /usr/share/perl5/PVE/API2/Subscription.pm && systemctl restart pveproxy.service"
alias thist='tail -n 30 ~/.bash_history'
alias vdir='ls --color=auto --format=long'
alias whence='type -a'
alias cls='clear'
alias drupdate='composer update drupal/core webflo/drupal-core-require-dev --with-dependencies'
alias dr8dl='composer require drupal/module'
alias dotRefresh='. ~/.bashrc'
alias mntz='sudo mount -t drvfs '\\harvard\cdm' /mnt/harvard'

# Setup History the RIGHT way…
shopt -o noclobber
shopt -s cmdhist
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"
export HISTIGNORE="&:[bf]g:exit:fortune:clear:cl:history:dict *:which *:shred *:man *:apropos rm *:mplayer *:source *:. *:gojo *:mutt"
export HISTCONTROL=erasedups:ignoreboth
export HISTTIMEFORMAT="%y-%m-%d %T "
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
alias hg='histgrep' 

# change default editor to vi:
set -o vi
export EDITOR='vi'
export VISUAL='vi'

if [ -f ~/.functions ]; then
  . ~/.functions
fi

alias upd='sudo apt-get update'
alias upg='sudo apt-get upgrade'
alias noblanks='awk "NF" '
alias octfilep='stat -c "%a %n" *'
alias mypath='tr ":" "\n" <<< "$PATH"'
alias grepIP='grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"'
alias myip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/\"//g'"
alias unlockWD='sudo ~/wdpassport-utils.py -u'
# to run the below bkpT510 cmd, first unlock the WD as above
# T510 Ubuntu Backup option --> WD "My Passport"
# /dev/sdb1  /mnt/mypassport   ntfs    user,fmask=0111,dmask=0000   0       0
# 
alias chkpy='                        \
  echo "python -V"; python -V;       \
  echo "python2 -V"; python2 -V;     \
  echo "python2.7 -V"; python2.7 -V; \
  echo "python3 -V"; python3 -V;            \
  echo "python3.7 -V"; python3.7 -V;        \
  echo "py -2 -V"; py -2 -V;                \
  echo "py -3 -V"; py -3 -V'

alias bkpT510='sudo tar czf \
    /mnt/mypassport/DRM/T510/T510_Backup_$(date +"%Y-%m-%d_%H-%M-%S").tar.gz \
    --exclude=/backup.tar.gz --exclude=/dev --exclude=/mnt --exclude=/proc \
    --exclude=/sys --exclude=/tmp --exclude=/lost+found /'

# webmin tricks [Ubuntu]
alias webmin_service_enable='sudo update-rc.d webmin enable'
alias webmin_service_disable='sudo update-rc.d webmin disable'
alias webmin_start='sudo service webmin start'
alias webmin_stop='sudo service webmin stop'

