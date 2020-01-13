# If set, the history list is appended to the file named by the value of the  HISTFILE  vari‐
# able when the shell exits, rather than overwriting the file.
shopt -s histappend

HISTFILE=$BASH_DATA_PATH/history

# no limit on what is stored in the history file
HISTFILESIZE=-1
HISTSIZE=-1

# dont put commands that start with a space in the history file
HISTCONTROL=ignorespace

# record time of command
HISTTIMEFORMAT='%F %T '

# If  set,  bash  attempts  to  save all lines of a multiple-line command in the same history
# entry.  This allows easy re-editing of multi-line commands.
shopt -s cmdhist

PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
