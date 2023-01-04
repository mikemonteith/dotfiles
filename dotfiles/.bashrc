# bash completion tool
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# git autocomplete
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

# terraform autocomplete
complete -C /opt/homebrew/bin/terraform terraform

# doctl autocomplete
source <(doctl completion bash)

# nvm autocomplete
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

alias k="kubectl"
. "$HOME/.cargo/env"
