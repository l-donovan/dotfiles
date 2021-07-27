# Oh-My-Zsh configuration
export ZSH=~/.oh-my-zsh
ZSH_THEME="af-magic"
DEFAULT_USER="ldonovan"
plugins=(git tmux fzf)
source $ZSH/oh-my-zsh.sh

# PATH
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

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
[[ -x ${which nvim} ]] && alias vim="nvim"
alias c="clear"
alias ssh='TERM=screen-256color ssh'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export FZF_DEFAULT_COMMAND='fd --type f'
export BYOBU_PREFIX='/usr/local'

export GROOVY_HOME=/usr/local/opt/groovy/libexec
export VULKAN_SDK=~/Vulkan/macOS
export VK_LAYER_PATH=~/Vulkan/macOS/share/vulkan/explicit_layer.d
export VK_ICD_FILENAMES=~/Vulkan/macOS/share/vulkan/icd.d/MoltenVK_icd.json

echo "\e[36m$USER\e[39m@\e[34m$HOST \e[92m`date +'%H:%M:%S'`"