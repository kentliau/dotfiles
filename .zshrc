source ~/.bash_profile

# Display current directory at windows title
# settitle() { printf "\e]0;$@\a" }
# dir_in_title() { settitle $PWD }
# chpwd_functions=(dir_in_title)

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

PROMPT='%2~${vcs_info_msg_0_} %F{green}:)%f '
#PROMPT='${vcs_info_msg_0_}:) '

