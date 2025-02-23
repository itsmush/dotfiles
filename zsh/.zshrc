
# ~~~~~~~~~~~~~~~ Start Tmux on every session ~~~~~~~~~~~~~~~~~~~~~~~
if [ -z "$TMUX" ]; then tmux attach -t TMUX || tmux new -s TMUX; fi


# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~
# Set to superior editing mode
set -o vi

export VISUAL=nvim
export EDITOR=nvim
export TERM="tmux-256color"

export BROWSER="firefox"

# Directories
export REPOS="$HOME/repos"
export GITUSER="itsmush"
export SCRIPTS="$HOME/scripts"
export DOTFILES="$HOME/dotfiles"


# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~
path=(
    $path
    $HOME/bin
    $HOME/.local/bin
    $SCRIPTS
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH


# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions


# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~
PURE_GIT_PULL=0
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure


# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~
alias v=nvim
alias e="exit"
alias c="clear"
alias pacman="sudo pacman"

alias scripts="cd $SCRIPTS"
alias cdblog="cd ~/websites/blog"

alias brain="cd $REPOS/second-brain/"
alias sb="brain"
alias homelab="cd $REPOS/homelab/"
alias lab="homelab"

# ls
alias ls='ls --color=auto'
alias la='ls -lathr --color=auto'
alias ll='ls -l --color=auto'

alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'


# ~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~~~~
fpath=($HOME/Repos/dotfiles/zsh/zsh-completions/src $fpath)
