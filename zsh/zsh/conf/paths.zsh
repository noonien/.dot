if [[ -d "$HOME/.go" ]]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin

    hash -d gosrc=$GOPATH/src/github.com/noonien
fi

if [[ -d "$HOME/bin" ]]; then
    export PATH=$HOME/bin:$PATH
fi
