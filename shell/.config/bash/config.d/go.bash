# no tracking please
export GONOSUMDB=*
export GONOPROXY=*

if [[ -d "$HOME/.go" ]]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
fi
