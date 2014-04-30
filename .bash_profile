# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init z   https://github.com/rupa/z
. ~/dotfiles/z/z.sh

# init rvm
source ~/.rvm/scripts/rvm


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

#############################################################################################
# Kent's
#############################################################################################

PATH=$PATH:$HOME/.rvm/bin:$HOME/.rbenv/bin:/usr/local/sbin:/usr/local/Cellar/ruby/2.1.1_1/bin

PS1=">: "

# put this in your .bash_profile
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

# Piece-by-Piece Explanation:
# the if condition makes sure we only screw with $PROMPT_COMMAND if we're in an iTerm environment
# iTerm happens to give each session a unique $ITERM_SESSION_ID we can use, $ITERM_PROFILE is an option too
# the $PROMPT_COMMAND environment variable is executed every time a command is run
# see: ss64.com/bash/syntax-prompt.html
# we want to update the iTerm tab title to reflect the current directory (not full path, which is too long)
# echo -ne "\033;foo\007" sets the current tab title to "foo"
# see: stackoverflow.com/questions/8823103/how-does-this-script-for-naming-iterm-tabs-work
# the two flags, -n = no trailing newline & -e = interpret backslashed characters, e.g. \033 is ESC, \007 is BEL
# see: ss64.com/bash/echo.html for echo documentation
# we set the title to ${PWD##*/} which is just the current dir, not full path
# see: stackoverflow.com/questions/1371261/get-current-directory-name-without-full-path-in-bash-script
# then we append the rest of $PROMPT_COMMAND so as not to remove what was already there
# voilà!

alias ll="ls -lahG"
#alias ll="ls -mpa"
alias cls="clear"

alias p="pwd"
alias dir="pwd"

#alias edit="nano"
#alias text="nano"

alias httpserver="http-server -c-1"

alias af="ruby /usr/local/Cellar/ruby/1.9.3-p385/bin/af"
alias compass="ruby /usr/local/Cellar/ruby/1.9.3-p385/lib/ruby/gems/1.9.1/gems/compass-0.12.2/bin/compass"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias flush_dns='sudo killall -HUP mDNSResponder; sudo dscacheutil -flushcache'

alias fix_open_with_duplicate='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'


# function helloworld () {
#  echo "hello with argument" ${1}
# }

function t(){
  pwd;
  tree;
}

function ti(){
  pwd;
  tree -a;
}

function ll(){
  pwd;
  ls -lahp;
}

function youtubedl () {
 cd ~/Downloads
 youtube-dl -F ${1} --verbose
 echo "Select Format: "
 read format
 youtube-dl -f $format ${1} --verbose
 cd ~
}

alias ytdl="youtubedl"

alias artisan="php artisan"
alias migrate="php artisan migrate"
alias migrate:make="php artisan migrate:make"


alias phpserver="php -S localhost:8080"

function forgot() {
  echo "=========================================================================="
  echo "    composer     : server side (php) and client side assets"
  echo "    component    : client side assets with build"
  echo "    bower        : client side assets"
  echo "    jam          : client side assets with build"
  echo "=========================================================================="
  echo "    subl         : sublime"
  echo "    httpserver   : node static http server"
  echo "    phpserver    : php build in server"
  echo "    total        : nodejs server framework"
  echo "    guard        : auto compile less,sass,coffee, and livereload,concat,uglify"
  echo "    gulp/grunt   : js task runner"
  echo "    harp         : static http server with preprocessor for haml, less, sass"
  echo "    jekyll       : static http server with include"
  echo "    compass      : compile compass"
  echo "    less/lessc   : compile less"
  echo "    browser-sync : synchronize browser state"
  echo "    dot-compiler : compile doT.js template file"
  echo "    myth         : CSS Polyfill preprocessor"
  echo "=========================================================================="
  echo "    npm          : node package management (use with sudo)"
  echo "    brew         : generic package management (mcrypt,ruby,mysql)"
  echo "    port      : generic package management"
  echo "    gem          : ruby package management"
  echo "    bundle       : rails package management"
  echo "=========================================================================="
  echo "    rails        : rails stuff"
  echo "    node         : node.js stuff (to update 'sudo n stable')"
  echo "=========================================================================="
  echo "                             LARAVEL SPECIFIC"
  echo " artisan = php artisan"
  echo " migrate = php artisan:migrate"
  echo "=========================================================================="
  echo "    passenger    : deploy ruby,python,node,meteor"
  echo "    nginx        : light weight server"
  echo "    php          : php 5.5"
  echo "    mysql        : mysql server"
  echo "=========================================================================="
  echo "    af           : app frog"
  echo "    heroku       : heroku"
  echo "=========================================================================="
  echo "    youtubedl    : @param youtube id or link"
  echo "    unzip        : @param path"
  echo "=========================================================================="
  echo "t, ti, grep, fgrep, egrep, curl, flush_dns, nano, pwd, ll, forgot"
  echo "=========================================================================="
  echo " top : monitor memory"
  echo " kill {id} : kill a process"
  echo "fix_open_with_duplicate"
  echo "=========================================================================="
}

alias omg="forgot"
alias forget="forgot"
alias hello="forgot"
alias shit="forgot"
alias ah="forgot"
alias oh="forgot"
alias tool="forgot"
alias tools="forgot"

##
# Your previous /Users/kentliau/.bash_profile file was backed up as /Users/kentliau/.bash_profile.macports-saved_2014-03-03_at_18:46:34
##

# MacPorts Installer addition on 2014-03-03_at_18:46:34: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

