#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias DW='sudo pacman -S'
alias RM='sudo pacman -Rns'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(pyenv init --path)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
alias config='/usr/bin/git --git-dir=/home/victor/.cfg/ --work-tree=/home/victor'
alias UD='sudo reflector --latest 20 --country Germany,Bulgaria --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist; sudo pacman -Syu'
alias INTL='setxkbmap -model pc104 -layout us -variant intl'
