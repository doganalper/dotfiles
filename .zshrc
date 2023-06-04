#Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Aliases
alias l='lsd -l -a'
alias config='cd ~/.config && nvim'
alias vi="\nvim"
alias tmux='tmux -f ~/.config/tmux/.tmux.conf'
alias lg='lazygit'
alias projects='cd ~/Desktop/projects'
alias cover="~/Desktop/projects/cover-letter-generator"
alias kill3000="kill -9 \$(lsof -ti:3000)"

eval $(/opt/homebrew/bin/brew shellenv)

bindkey "ç" fzf-cd-widget # bind Opt-C to change directory to selected fzf result

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function parse_git_branch() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1) /p'
}

COLOR_DEF=$'\e[0m'
COLOR_DIR=$'\e[38;5;197m'
COLOR_GIT=$'\e[38;5;39m'
NEW_LINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%2~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEW_LINE}'
export DENO_INSTALL="/Users/alperdogan/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH":~/.node/bin
export FZF_DEFAULT_OPTS='--layout=reverse'

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
