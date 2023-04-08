#Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Listing folders
alias ll='ls -l -a'

# Nvim config
alias nvimconfig='cd ~/.config/nvim && nvim init.lua'
alias config='cd ~/.config && nvim'
alias vi="\nvim"
alias tmux='tmux -f ~/.config/tmux/.tmux.conf'

# Go to projects folder (and project folder if given)
alias projects='cd ~/Desktop/projects'

alias lg='lazygit'

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
export PROMPT='${COLOR_DIR}%2~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}'

export DENO_INSTALL="/Users/alperdogan/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$PATH":~/.node/bin

export FZF_DEFAULT_OPTS='--height 40% --border'

alias work="timer 50m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"
        
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"


# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
