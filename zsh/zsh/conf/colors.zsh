# enable zsh colors
autoload -U colors && colors


ZSH_DIRCOLORS=$ZSH_LOCAL/dircolors
DIRCOLORS_REPO=https://github.com/seebi/dircolors-solarized.git

if [ ! -d $ZSH_DIRCOLORS ]; then
    git clone --recursive $DIRCOLORS_REPO $ZSH_DIRCOLORS
fi

# load dircolors-solarized
eval `dircolors $ZSH_DIRCOLORS/dircolors.ansi-dark`
