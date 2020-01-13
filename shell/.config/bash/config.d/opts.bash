# If  set, a command name that is the name of a directory is executed as if it were the argu‐
# ment to the cd command.  This option is only used by interactive shells.
shopt -s autocd

# If set, bash lists the status of any stopped and running jobs before exiting an interactive
# shell.  If any jobs are running, this causes the exit to be deferred until a second exit is
# attempted  without  an intervening command (see JOB CONTROL above).  The shell always post‐
# pones exiting if any jobs are stopped.
shopt -s checkjobs

# If set, bash includes filenames beginning with a `.' in the results of pathname expansion.
shopt -s dotglob 

# If set, the pattern ** used in a pathname expansion context will match all files  and  zero
# or  more  directories and subdirectories.  If the pattern is followed by a /, only directo‐
# ries and subdirectories match.
shopt -s globstar

# If  set,  bash  replaces directory names with the results of word expansion when performing
# filename completion.  This changes the contents of the readline  editing  buffer.   If  not
# set, bash attempts to preserve what the user typed.
shopt -s direxpand
