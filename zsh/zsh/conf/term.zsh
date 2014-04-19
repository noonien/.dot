# choose the first available terminal of the preferred ones
PREF_TERMS=(xterm-256color screen-256color xterm screen)
_old_term=$TERM
for TERM ($PREF_TERMS); do
    if tput cols &>/dev/null; then
        export TERM
        break
    fi
    TERM=$_old_term
done 2>/dev/null

# enable zsh colors
autoload -U colors && colors
