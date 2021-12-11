# bash completion tool
[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

# git autocomplete
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

# terraform autocomplete
complete -C /usr/local/bin/terraform terraform

# doctl autocomplete
source <(doctl completion bash)

# nvm autocomplete
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

alias k="kubectl"
