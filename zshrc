# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh


source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

source ~/.zsh_aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.1.0/bin:$HOME/.gem/ruby/3.1.0/bin:$PATH"

# Change fzf completion from **
export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)if command -v pyenv 1>/dev/null 2>&1; then

# set kubectl to local one
ln -sf /usr/local/bin/kubectl ~/.rd/bin/kubectl

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

PROMPT_EOL_MARK=''

source "$(brew --prefix asdf)/libexec/asdf.sh"

# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize  # commented out by conda initialize

# echo 'conda stuff'
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
    # eval "$__conda_setup"
# else
    # if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        # . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    # else
        # export PATH="/usr/local/anaconda3/bin:$PATH"
    # fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# conda deactivate

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
