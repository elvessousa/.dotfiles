export ANDROID_HOME=$HOME/Library/Android/sdk
PATH=$HOME/.npm-global/bin:$PATH
PATH=/opt/homebrew/bin:$PATH
PATH=/opt/homebrew/sbin:$PATH
PATH=/opt/homebrew/opt/node@22/bin:$PATH
PATH=/nix/var/nix/profiles/default/bin:$PATH
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/platform-tools
. "$HOME/.cargo/env"
