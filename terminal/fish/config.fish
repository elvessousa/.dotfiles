# Environment variables
set PATH $PATH $HOME/.cargo/bin
set PATH $PATH /usr/local/mysql/bin
set PATH $PATH $HOME/Applications/bin
set PATH $PATH $HOME/.local/bin
set PATH $PATH $HOME/.local/share/gem/ruby/3.0.0/bin
set PATH $PATH $HOME/Android/Sdk
export PATH

# Aliases
alias cat='bat'
alias l='eza'
alias ll='eza -lah'
alias lt='eza --tree --level=2'
alias n='nvim .'
alias v='vim .'

# Starship
starship init fish | source
