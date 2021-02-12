#!/bin/bash

# Paths
nvim_folder="$(pwd)/nvim"
nvim_path="$HOME/.config/nvim"
tmux_file="$(pwd)/tmux/.tmux.conf"
git_file="$(pwd)/git/.gitconfig"
fish_file="$(pwd)/fish/config.fish"
fish_path="$HOME/.config/fish/config.fish"
term_info="$(pwd)/terminal/xterm-256color-italic.terminfo"
alacritty_conf="$(pwd)/alacritty/alacritty.yml"

# Colors and formatting
b="$(tput bold)"
d='\033[2m' 
y='\033[33;33m'
n='\033[0m'

# Create symbolic links 
function createLink() {
  clear;
  echo "Creating symlinks to $3 configuration file(s):"
  echo -e " - ${d} $2 ${y}->${b} $1 ${n}"
  if type -p "$3" > /dev/null; then
    ln -sf $1 $2
  else
    echo "Ooops: $3 not found."
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
      createLink $nvim_folder/init.vim "$nvim_path/init.vim" 'nvim'
      createLink $nvim_folder/colors/ $nvim_path/colors/ 'nvim'
      break;;
    '2') 
      createLink $tmux_file "$HOME/.tmux.conf" 'tmux'
      break;;
    '3') 
      createLink $git_file "$HOME/.gitconfig" 'git'
      break;;
    '4') 
      createLink $fish_file $fish_path 'fish'
      break;;
    '5') 
      configureItalics
      break;;
    *)
      echo "Good luck."
      break;
  esac
done

