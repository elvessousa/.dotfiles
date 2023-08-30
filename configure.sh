#!/bin/sh

# ---------------------------------
# OS Detection: Linux and macOS
# ---------------------------------
case "$OSTYPE" in
  darwin*)  system="macOS" ;; 
  linux*)   system="linux" ;;
  *)        system="" ;;
esac

# ---------------------------------
# Paths
# ---------------------------------
# VIM
vim_folder="$(pwd)/editors/vim"
vim_path="$HOME/.vim"

# NVIM
nvim_folder="$(pwd)/editors/nvim"
nvim_path="$HOME/.config/nvim"

# Helix
helix_folder="$(pwd)/editors/helix"
helix_path="$HOME/.config/helix"

# Vim Plug
vimplug_file="$HOME/.vim/autoload/plug.vim"
vimplug_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# CoC
coc_json="$(pwd)/editors/nvim/coc-settings.json"
coc_nvim_path="$nvim_path/coc-settings.json"
coc_vim_path="$vim_path/coc-settings.json"

# Tmux
tmux_file="$(pwd)/terminal/tmux/.tmux.conf"
tmux_path="$HOME/.tmux.conf"

# Zellij
zellij_file="$(pwd)/terminal/zellij/config.kdl"
zellij_folder="$HOME/.config/zellij"
zellij_path="$zellij_folder/config.kdl"

# Git
git_file="$(pwd)/git/.gitconfig"
git_path="$HOME/.gitconfig"

# Fish
fish_file="$(pwd)/terminal/fish/config.fish"
fish_folder="$HOME/.config/fish"
fish_path="$fish_folder/config.fish"

# Nu Shell
nu_config_file="$(pwd)/terminal/nushell/config.nu"
nu_config_folder="$HOME/.config/nushell"
nu_config_path="$nu_config_folder/config.nu"
nu_env_file="$(pwd)/terminal/nushell/env.nu"
nu_env_path="$nu_config_folder/env.nu"

# Terminal
term_info="$(pwd)/terminal/xterm-256color-italic.terminfo"

# Alacritty
alacritty_file="$(pwd)/terminal/alacritty/alacritty-$system.yml"
alacritty_folder="$HOME/.config/alacritty"
alacritty_path="$alacritty_folder/alacritty.yml"

# Kitty
kitty_file="$(pwd)/terminal/kitty/kitty-$system.conf"
kitty_folder="$HOME/.config/kitty"
kitty_path="$kitty_folder/kitty.conf"

# Wezterm
wezterm_file="$(pwd)/terminal/wezterm/wezterm-$system.lua"
wezterm_folder="$HOME/.config/wezterm/"
wezterm_path="$wezterm_folder/wezterm.lua"

# i3
i3_files="$(pwd)/wms/i3"
i3_path="$HOME/.config/"

# Sway and Waybar
sway_files="$(pwd)/wms/sway/sway"
waybar_files="$(pwd)/wms/sway/waybar"
sway_path="$HOME/.config/"

# ---------------------------------
# Colors and formatting
# ---------------------------------
b="$(tput bold)"
d='\033[2m' 
y='\033[33;33m'
n='\033[0m'

# ---------------------------------
# Detect CTRL-C
# ---------------------------------
function exitGracefully() {
  printf "\n Good luck."
  exit 2
}

trap exitGracefully 2

# ---------------------------------
# Create symbolic links 
# ---------------------------------
function createLink() {
  if [ "$4" != "show" ]; then
    clear;
    echo "Creating symlinks to $3 configuration file(s):"
  fi

  if type -p "$3" > /dev/null; then
    echo -e " - ${d} $2 ${y}->${b} $1 ${n}"
    ln -sf $1 $2
  elif [ "$3" == 'alacritty' ]; then 
    echo -e " - ${d} $2 ${y}->${b} $1 ${n}"
    ln -sf $1 $2
  else
    echo "Ooops: $3 not found."
  fi
}

# ---------------------------------
# Configure italics on terminal
# ---------------------------------
function configureItalics() {
  clear
  echo -e "\033[3m Is this text in italics? \033[23m"
  read -p " [y/n]: " hasItalic

  case $hasItalic in
    [yY])
      echo 'You do not need to setup this one!'
      break;;
    [nN])
      echo 'Setting up terminal profile:'
      tic $term_info
      break;;
    *)
      echo 'Skipping!'
      break;
  esac
}

# ---------------------------------
# Instructions on screen
# ---------------------------------
clear
echo -e "$d-------------------------------------------------------$n"
echo -e "$b Configuration files setup script $n"
echo -e "$b Current OS:$n ${y}$system ${d}($OSTYPE)${n}"
echo -e "$d-------------------------------------------------------$n"
echo ' Select an action below to start:'
echo -e " ${y}0)${n} Configure ${b}Vim${n}"
echo -e " ${y}1)${n} Configure ${b}Neovim${n}"
echo -e " ${y}2)${n} Configure ${b}Neovim (with Lua)${n}"
echo -e " ${y}3)${n} Configure ${b}Helix${n}"
echo -e " ${y}4)${n} Configure ${b}Tmux${n}"
echo -e " ${y}5)${n} Configure ${b}Zellij${n}"
echo -e " ${y}6)${n} Configure ${b}Git${n}"
echo -e " ${y}7)${n} Configure ${b}Fish Shell${n}"
echo -e " ${y}8)${n} Configure ${b}Nu Shell${n}"
echo -e " ${y}9)${n} Configure ${b}italics${n} in terminal"
echo -e " ${y}10)${n} Configure ${b}Alacritty${n}"
echo -e " ${y}11)${n} Configure ${b}Kitty${n}"
echo -e " ${y}12)${n} Configure ${b}Wezterm${n}"
echo -e " ${y}13)${n} Install ${b}Vim Plug${n}"
echo -e " ${y}14)${n} Configure ${b}i3${n}"
echo -e " ${y}15)${n} Configure ${b}Sway${n} and ${b}Waybar${n}"
echo -e "$d-------------------------------------------------------$n"

# ---------------------------------
# Input option
# ---------------------------------
read -p ' - Which option?: ' answer

# ---------------------------------
# Do the configuration after input
# ---------------------------------
while true 
do
  case $answer in
    '0')
      createLink $vim_folder/.vimrc "$HOME/.vimrc" 'vim' 
      createLink $nvim_folder/colors/ $vim_path/colors 'vim' 'show'
      createLink $coc_json $coc_vim_path 'vim' 'show'
      break;;
    '1')
      mkdir -p $nvim_path
      createLink $nvim_folder/init.vim "$nvim_path/init.vim" 'nvim' 
      createLink $nvim_folder/colors/ $nvim_path/colors 'nvim' 'show'
      createLink $coc_json $coc_nvim_path 'nvim' 'show'
      break;;
    '2')
      mkdir -p $nvim_path
      createLink $nvim_folder/init.lua "$nvim_path/init.lua" 'nvim' 
      createLink $nvim_folder/colors/ $nvim_path/colors 'nvim' 'show'
      createLink $nvim_folder/lua/ $nvim_path/lua 'nvim' 'show'
      break;;
    '3')
      mkdir -p $helix_folder
      createLink $helix_folder/config.toml "$helix_path/config.toml" 'hx' 
      createLink $helix_folder/languages.toml "$helix_path/languages.toml" 'hx' 
      break;;
    '4') 
      createLink $tmux_file $tmux_path 'tmux'
      break;;
    '5')
      mkdir -p $zellij_folder
      createLink $zellij_file $zellij_path 'zellij'
      break;;
    '6') 
      createLink $git_file $git_path 'git'
      break;;
    '7') 
      mkdir -p $fish_folder
      createLink $fish_file $fish_path 'fish'
      break;;
    '8') 
      mkdir -p $nu_config_folder
      createLink $nu_config_file $nu_config_path 'nu'
      createLink $nu_env_file $nu_env_path 'nu'
      break;;
    '9') 
      configureItalics
      break;;
    '10') 
      mkdir -p $alacritty_folder
      createLink $alacritty_file $alacritty_path 'alacritty'
      break;;
    '11') 
      createLink $kitty_file $kitty_path 'kitty'
      break;;
    '12') 
      mkdir -p $wezterm_folder
      createLink $wezterm_file $wezterm_path 'cd'
      break;;
    '13')
      curl -fLo $vimplug_file --create-dirs $vimplug_url
      break;;
    '14')
      createLink $i3_files $i3_path 'i3'
      break;;
    '15')
      createLink $sway_files $sway_path 'sway'
      createLink $waybar_files $sway_path 'waybar'
      break;;
    *)
      echo " Good luck."
      break;
  esac
done

