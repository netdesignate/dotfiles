# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# setup .history for searches by "histgrep" and/or "hg" (alias)
cat ~/.bash_history >> ~/.history
awk '!x[$0]++' ~/.history > ~/.bash_history
\cp --force ~/.bash_history ~/.history
