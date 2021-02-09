#!/bin/bash

# Paths
nvim_folder="$(pwd)/nvim"
nvim_path="$HOME/.config/nvim"
tmux_file="$(pwd)/tmux/.tmux.conf"
git_file="$(pwd)/git/.gitconfig"
fish_file="$(pwd)/fish/config.fish"
fish_path="$HOME/.config/fish/config.fish"
term_info="$(pwd)/terminal/xterm-256color-italic.terminfo"

# Colors and formatting
b="$(tput bold)"
d='\033[2m' 
y='\033[33;33m'
n='\033[0m'

# Create symbolic links 
function createLink() {
  echo -e " - ${d} $2 ${y}->${b} $1 ${n}"
  ln -sf $1 $2
}

# NVIM files installation
function installNvimConfigs() {
  if type -p 'nvim' > /dev/null; then
    echo "Nvim found!";
    echo -e "${b}Linking nvim init file:${n}"
    createLink $nvim_folder/init.vim "$nvim_path/init.vim"
    createLink $nvim_folder/colors $nvim_path/colors
  else
    echo 'NVIM is not installed!'
  fi
}

# TMUX config installation
function installTmuxConfig() {
  if type -p 'tmux' > /dev/null; then
    echo 'Linking Tmux config file:';
    createLink $tmux_file "$HOME/.tmux.conf"
  else
    echo 'TMUX is not installed!'
  fi
}


# Git config installation
function installGitConfig() {
  if type -p 'git' > /dev/null; then
    echo 'Linking Tmux config file:';
    createLink $git_file "$HOME/.gitconfig"
  else
    echo 'Git is not installed!'
  fi
}

# Git config installation
function installFishConfig() {
  if type -p 'fish' > /dev/null; then
    echo 'Linking Fish Shell config file:';
    createLink $fish_file $fish_path
    cat $fish_file 
    echo $fish_path
  else
    echo 'Fish Shell is not installed!'
  fi
}

# Configure italics on terminal
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

# Instructions on screen
clear
echo -e "$d-------------------------------------------------------$n"
echo -e "$b Config files install script $n"
echo -e "$d-------------------------------------------------------$n"
echo ' Select an action below to start:'
echo -e " ${y}1)${n} Configure ${b}NVim${n}"
echo -e " ${y}2)${n} Configure ${b}Tmux${n}"
echo -e " ${y}3)${n} Configure ${b}Git${n}"
echo -e " ${y}4)${n} Configure ${b}Fish Shell${n}"
echo -e " ${y}5)${n} Configure ${b}italics${n} in terminal"
echo -e "$d-------------------------------------------------------$n"

# Input option
read -p ' - Which option?: ' answer

# Do the configuration after input
while true 
do
  case $answer in
    '1')
      clear;
      installNvimConfigs
      break;;
    '2') 
      installTmuxConfig
      break;;
    '3') 
      installGitConfig
      break;;
    '4') 
      installFishConfig
      break;;
    '5') 
      configureItalics
      break;
  esac
done

