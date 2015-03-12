ZGEN_SOURCE=$ZSH_LOCAL/zgen
ZGEN_DIR=$ZSH_LOCAL/plugins
ZGEN_REPO=https://github.com/tarjoilija/zgen.git

# Get zgen if missing
if [ ! -d $ZGEN_SOURCE ]; then
    git clone --recursive $ZGEN_REPO $ZGEN_SOURCE
fi

# Load zgen
source $ZGEN_SOURCE/zgen.zsh
if ! zgen saved; then
    echo "Creating zgen save"

    zgen oh-my-zsh

    zgen oh-my-zsh plugins/debian
    zgen oh-my-zsh plugins/ssh-agent

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/colored-man

    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/python

    zgen oh-my-zsh themes/jreese

    zgen save
fi
