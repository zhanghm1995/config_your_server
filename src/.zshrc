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
antigen bundle skywind3000/z.lua
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