# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="clean"
# ZSH_THEME="avit"
# ZSH_THEME="norm"
# ZSH_THEME="cloud"
# ZSH_THEME="garyblessington"
# ZSH_THEME="lambda"
# ZSH_THEME="robbyrussell"
ZSH_THEME="benny"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias be="bundle exec"
# alias irssi='TERM=screen-256color irssi'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git chruby ruby rails gem history history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export SCALA_HOME="/home/benny/Web/scala"

export PATH="/usr/local/ldc2/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/home/benny/.local/bin:$PATH"
export PATH="$SCALA_HOME/bin:$PATH"
export Path="/usr/local/activator/activator:$PATH"


# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
# export EDITOR='vim'
# else
# export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# export TERM="xterm-256color"
# export TERM="screen-256color"
# export TERM="gnome-256color"
# export TERM=screen-256color-bce

# Always work in a tmux session if tmux is installed
[ -z "$TMUX" ] && export TERM=xterm-256color && exec tmux


source /usr/local/share/chruby/chruby.sh
source /home/benny/.aliases


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias 'glg' = pretty_git_log()

pretty_git_log() {
    git log --graph --pretty="tformat:${FORMAT}" $* |
        # Replace (2 years ago) with (2 years)
        sed -Ee 's/(^[^<]*) ago\)/\1)/' |
        # Replace (2 years, 5 months) with (2 years)
        sed -Ee 's/(^[^<]*), [[:digit:]]+ .*months?\)/\1)/' |
        # Line columns up based on } delimiter
        column -s '}' -t |
        # Color merge commits specially
        sed -Ee "s/(Merge (branch|remote-tracking branch|pull request) .*$)/$(printf $ANSI_RED)\1$(printf $ANSI_RESET)/" |
        # Page only if we're asked to.
        if [ -n "$GIT_NO_PAGER" ]; then
            cat
        else
            # Page only if needed.
            less --quit-if-one-screen --no-init --RAW-CONTROL-CHARS --chop-long-lines
        fi
}


# BEGIN Ruboto setup
source ~/.rubotorc
# END Ruboto setup

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %F{$code}$ZSH_SPECTRUM_TEXT%f"
  done
}
