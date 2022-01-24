# Oh-My-Zsh configuration
export ZSH=~/.oh-my-zsh
ZSH_THEME="af-magic-luke"
DEFAULT_USER="ldonovan"
plugins=(git tmux fzf virtualenv)
source $ZSH/oh-my-zsh.sh

# PATH
export PATH="${HOME}/bin:${PATH}"
export PATH="${HOME}/.pyenv/shims:${PATH}"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="vim"
else
    export EDITOR="nvim"
fi

# Virtualenvwrapper
if [[ -f "/usr/local/bin/virtualenvwrapper.sh" ]]; then
    export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
    export WORKON_HOME="$HOME/python_environments"
    source "/usr/local/bin/virtualenvwrapper.sh"
fi

# Aliases
[[ -f "/usr/local/bin/git" ]] && alias git="/usr/local/bin/git"
[[ -x $(which nvim) ]] && alias vim="nvim"
alias c="clear"
alias ssh='TERM=screen-256color ssh'
alias pgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/id_ed25519_personal -o IdentitiesOnly=yes' git"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export FZF_DEFAULT_COMMAND='fd --type f'
export BYOBU_PREFIX='/usr/local'
export HISTSIZE=10000
export SAVEHIST=10000

echo "\e[36m$USERNAME\e[39m@\e[34m$HOST \e[92m`date +'%H:%M:%S'`"

# Device-specific configuration
[[ -f ~/.local_zshrc ]] && source ~/.local_zshrc
