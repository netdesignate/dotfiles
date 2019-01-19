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

# Setup History the RIGHT way…

shopt -s cmdhist
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"
export HISTIGNORE="&:[bf]g:exit:fortune:clear:cl:history:dict *:which *:shred *:man *:apropos *:sudo rm *:sudo cat *:mplayer *:source *:. *:gojo *:mutt"
export HISTCONTROL=erasedups:ignoreboth
unset HISTFILESIZE
export HISTSIZE=1000000

function myip(){
  dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/"//g'
}

function histgrep() {
  local n_lines=10
  if [[ "$1" =~ ^[0-9]*$ ]]; then
    n_lines="$1"
    shift
  fi
  grep --with-filename --line-number "$@" ~/.history | tail -n "$n_lines"
}

function ipchk() {
#  echo grep --color -ir $1 ~/MyFiles/IP_Data.txt
  grep --color -ir $1 /cygdrive/c/Users/bf591ah/Documents/Supported_Tools/STEALTHWATCH/IPAM.txt
}
