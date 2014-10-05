######################################################################
# Misc
######################################################################
export PATH="/usr/local/bin:$PATH"

# Bash line editing to vi mode
set -o vi

# Not sure why this is here
export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"
export LS_COLORS="ExFxBxDxCxegedabagacad"

# Italics in iterm. Tutorial:
# https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
export TERM="xterm-256color-italic"

######################################################################
# Text Editor
######################################################################
export EDITOR="/usr/local/bin/vim"
export VISUAL="vim"

######################################################################
# Python
######################################################################
export PYTHONPATH="$HOME/Code"

# Disable creation of .pyc, __pycache__ files
# Sometimes useful in development
#export PYTHONDONTWRITEBYTECODE=True

# Cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"

alias ipy="ipython"

# Virtualenv
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python"
export VIRTUALENVWRAPPER_VIRTUALENV="/usr/local/bin/virtualenv"
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/Code/Projects"
source /usr/local/bin/virtualenvwrapper.sh
# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=True

######################################################################
# Keys, Tokens, etc.
######################################################################
if [ -f $HOME/.sensitives ]; then
    source $HOME/.sensitives
fi
