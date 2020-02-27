# no tracking please
export GONOSUMDB='*'
export GONOPROXY='*'
export GOPRIVATE='*'

if [[ -d "$HOME/.go" ]]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
fi
