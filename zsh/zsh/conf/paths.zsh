if [[ -d "$HOME/go" ]]; then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

if [[ -d "$HOME/bin" ]]; then
    export PATH=$HOME/bin:$PATH
fi
