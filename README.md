.dot
====

Theese are my dotfiles


Installation
------------

While in your $HOME, do the following:

    git clone --recursive https://github.com/noonien/.dot.git
    cd .dot
    ./dot install


Additional steps
----------------

To install the (neo)vim plugins you need to run :PlugInstall. zsh plugins are
installed once a zsh shell is started.

Because the vim and zsh plugin managers require git, and the installation
script does not currently install any system utilities, you will need to
install git yourself.
