# https://www.reddit.com/r/MacOS/comments/sqwsh5/comment/k9nuaxq/?utm_source=share&utm_medium=web2x&context=3 screen scaling issue fix

# Aliases
alias l='ls -l -a'
alias config='cd ~/.config && nvim'
alias vi="\nvim"
alias tmux='tmux -f ~/.config/tmux/.tmux.conf'
alias lg='lazygit'
alias projects='cd ~/Desktop/projects'
alias kill3000="kill -9 \$(lsof -ti:3000)"
alias weather="curl https://tr.wttr.in/istanbul"

function video_to_gif () {
  ffmpeg -i $1  -r 15 -vf scale=1024:-1 $2
}

# Git aliases
alias gf='git fetch'
alias gpo='git push origin HEAD'
alias gs='git status'
alias gb='git branch'

# Helpful cli tools for myself
alias cover="node ~/Desktop/projects/cover-letter-generator/index.js"
alias accounts="~/Desktop/projects/social-account-copy/account-copy"

eval $(/opt/homebrew/bin/brew shellenv)

# bindkey "ç" fzf-cd-widget # bind Opt-C to change directory to selected fzf result

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

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/alperdogan/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zsh auto suggest plugin
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Bob https://github.com/MordechaiHadad/bob
export PATH="/Users/alperdogan/.local/share/bob/nvim-bin:$PATH"


# bun completions
[ -s "/Users/alperdogan/.bun/_bun" ] && source "/Users/alperdogan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
