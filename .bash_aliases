alias bkup_cec='mysqldump -u cecLite -p cecLite > cecLite-$(date +%F-%H%M).sql'
alias cd8='cd /var/www/ce8'
alias cdj='cd /var/www/jaxbeachtech.com'
alias cdw='cd /var/www/multisite'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ld='ls -al | grep ^d'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias wetail='sudo tail -n 200 /var/log/apache2/error.log | less'
alias wtail='sudo tail -n 200 /var/log/apache2/access.log | less'
alias df='df -h'
alias dir='ls --color=auto --format=vertical'
alias du='du -h'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color'
alias l='ls -CF'
alias la='ls -la'
alias less='less -r'
alias ll='ls -lahF --color=auto'
alias ls='ls -hF --color=tty'
alias lsd='ls -al | grep ^d'
alias thist='tail -n 30 ~/.bash_history'
alias vdir='ls --color=auto --format=long'
alias whence='type -a'
alias nonag="sed -i.bak 's/NotFound/Active/g' /usr/share/perl5/PVE/API2/Subscription.pm && systemctl restart pveproxy.service"
alias cls='clear'
alias drupdate='composer update drupal/core webflo/drupal-core-require-dev --with-dependencies'
alias dr8dl='composer require drupal/module'

# Setup History the RIGHT way…

shopt -s cmdhist
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"
export HISTIGNORE="&:[bf]g:exit:fortune:clear:cl:history:dict *:which *:shred *:man *:apropos rm *:mplayer *:source *:. *:gojo *:mutt"
export HISTCONTROL=erasedups:ignoreboth
unset HISTFILESIZE
export HISTSIZE=1000000

# change default editor to vi:

export EDITOR='vi'
export VISUAL='vi'

if [ -f ~/.functions ]; then
  . ~/.functions
fi

# webmin tricks [Ubuntu]

alias webmin_service_enable='sudo update-rc.d webmin enable'
alias webmin_service_disable='sudo update-rc.d webmin disable'
alias webmin_start='sudo service webmin start'
alias webmin_stop='sudo service webmin stop'

