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

# Start rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Now we can pipe to multiple outputs!
setopt MULTIOS

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME

# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT
