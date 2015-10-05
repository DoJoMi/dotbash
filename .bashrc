###########################################
#.bashrc
###########################################

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# update window size
shopt -s checkwinsize


#PS1="\n\[\033[0;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;37m\]\h'; else echo '\[\033[0;37m\]\u@\h'; fi)\[\033[0;37m\])\342\224\200(\$(if [[ \$? == 0 ]]; then echo \"\[\033[1;32m\]\342\234\223\"; else echo \"\[\033[1;31m\]\342\234\227\"; fi)\[\033[1;37m\])\342\224\200(\[\033[0;37m\]\@ \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -lah | grep -m 1 total | sed 's/total //')b\[\033[1;37m\])\342\224\200> \[\033[0m\]"
PS1='\u \[\033[1;36m\]\W \[\033[1;31m\]\$\[\033[0m\] '

#include all files from .bash_files
for file in ~/.bash_files/*; do
  source "$file"
done


