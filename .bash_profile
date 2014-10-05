# Ensure user-installed binaries take precedence
export PATH="/usr/local/bin:$PATH"

if [ -f $HOME/.bash_profile ]; then
    source $HOME/.bashrc
fi
