ZSH_FZF=$ZSH_LOCAL/fzf
FZF_REPO=https://github.com/junegunn/fzf.git

if [ ! -d $ZSH_FZF ]; then
    git clone --depth 1 $FZF_REPO $ZSH_FZF

    $ZSH_FZF/install \
        --completion \
        --key-bindings \
        --no-update-rc \
        --no-bash --no-fish
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
