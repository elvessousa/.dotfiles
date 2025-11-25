# Environment variables
export ANDROID_HOME=$HOME/Library/Android/sdk
set PATH $PATH $HOME/.cargo/bin
set PATH $PATH /usr/local/mysql/bin
set PATH $PATH /usr/local/bin
set PATH $PATH $HOME/Applications/bin
set PATH $PATH $HOME/.local/bin
set PATH $PATH $HOME/.npm-global/bin
set PATH $PATH $HOME/.local/share/gem/ruby/3.0.0/bin
set PATH $PATH $HOME/Android/Sdk
set PATH $PATH /opt/homebrew/bin
set PATH $PATH $ANDROID_HOME/emulator
set PATH $PATH $ANDROID_HOME/platform-tools
export PATH

# Aliases
alias cat='bat'
alias l='eza --icons --group-directories-first'
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias update='sudo pacman -Syu'
alias n='nvim .'
alias v='vim .'

# Starship
starship init fish | source
