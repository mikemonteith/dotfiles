export CLICOLOR=1
export LSCOLORS=gxexDaxxcxxxxxcxcxexex

export GREP_COLOR="0;91;49" #normal font; light red text; default background
export GREP_OPTIONS="--color=auto"

export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# Prevent the "mac osx default shell is now zsh" warnings
export BASH_SILENCE_DEPRECATION_WARNING=1

export NVM_DIR="$HOME/.nvm"

export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
export PATH=`gem environment gemdir`/bin:$PATH

#Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Set vim as the default kubectl editor, instead of vi
export KUBE_EDITOR="vim"
export EDITOR="vim"

export SHELL="/bin/bash"

# Postgres connection defaults
export PGHOST="localhost"

# If homebrew was installed into /opt/ (M1 mac only), then we need to export it's shell env
if (command -v /opt/homebrew/bin/brew > /dev/null); then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set up pyenv, so that the python and pip commands run the pyenv version instead of MacOS default
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# This loads nvm
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"

source ~/.bashrc
. "$HOME/.cargo/env"
