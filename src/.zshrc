source ~/.antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
#
# # Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
# antigen bundle autojump
# antigen bundle skywind3000/z.lua
antigen bundle esc/conda-zsh-completion

# # Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
# # Load the theme.
# antigen theme agnoster
antigen theme robbyrussell
#
# # Tell Antigen that you're done.
antigen apply

export TERM=xterm-256color


## Zhanghm add
## -----------For tmux----------------
alias t='tmux'
alias tls='tmux ls'
alias tn='tmux new -s'
alias ta='tmux a -t'
## -----------For tmux----------------

## -----------Alias----------------
alias sbrc="source ~/.bashrc"
alias vbrc="vim ~/.bashrc"
alias vzrc="vim ~/.zshrc"
alias szrc="source ~/.zshrc"

alias lsdn='ls -l|grep "^d"| wc -l' # count folder number
alias lsfn='ls -l|grep "^-"| wc -l'  # count files number
alias lsd='ls -d */' # only list directory in current path
alias df='df -hl'

alias aptu="sudo apt-get update"
alias aptg="sudo apt-get upgrade"
alias apti="sudo apt-get install"
alias r="reset"
alias p='pwd'

alias cl='conda list | grep '
alias pl='pip list | grep '

alias g='gpustat -i'
alias n="nvidia-smi"
alias wn="watch -n 0.5 nvidia-smi"

alias cdd='cd /data/haiming'
## -----------Alias----------------

# for gcc and g++
export CC=`which gcc`
export CXX=`which g++`

export CUDA_DEVICE_ORDER=PCI_BUS_ID
