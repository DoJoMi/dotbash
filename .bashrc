###########################################
#.bashrc
###########################################

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# update window size
shopt -s checkwinsize

#include all files from .bash_files
for file in $HOME/.bash/.bash_files/*; do
  source "$file"
done


