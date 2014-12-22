PATH=$PATH:$HOME/.rvm/bin:$HOME/.rbenv/bin:/usr/local/sbin:/usr/local/Cellar/ruby/2.1.1_1/bin:~/.composer/vendor/bin

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

PS1=":) "

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

alias compass="ruby /usr/local/Cellar/ruby/1.9.3-p385/lib/ruby/gems/1.9.1/gems/compass-0.12.2/bin/compass"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias flush_dns='sudo killall -HUP mDNSResponder; sudo dscacheutil -flushcache'

alias fix_open_with_duplicate='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

alias show_invisible_files='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
alias hide_invisible_files='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'

# function helloworld () {
#  echo "hello with argument" ${1}
# }

alias fresh_tree="tree -C"
alias dried_tree="tree -n"

function ll(){
  pwd;
  ls -lahp;
}

# Use it with pipe
# Example
# php artisan routes | strip_colors > routes.txt
alias strip_colors="perl -pe 's/\x1b\[[0-9;]*m//g'"

alias vtop="vtop --theme becca"
alias top_visual="vtop --theme becca"

function youtubedl () {
 #current_work_directory=$(pwd)
 cd ~/Downloads
 youtube-dl -F ${1} --verbose
 echo "Select Format: "
 read format
 youtube-dl -f $format ${1} --verbose
 #cd $current_work_directory
}

alias ydl="youtubedl"

function make_executable() {
 echo "chmod +x [filename]"
}

function clean_launch_daemon() {
  echo "~/Library/LaunchAgents"
  echo "/Library/LaunchAgents"
  echo "/Library/LaunchDaemons"
  echo "/System/Library/LaunchAgents"
  echo "/System/Library/LaunchDaemons"
  echo "Go to these places"
}

function rebuild_launch_service() {
  echo "copy and past this command"
  echo "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user ; killall Dock"
}

function app () {
  open -a "${1}"
}

alias apps="ls /Applications | more"

alias npm_list="sudo npm -g list --depth=0"

function npm_upgrade() {
  set -e
  set -x

  for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f2)
  do
      sudo npm -g install "$package"
  done
}

alias httpserver="http-server -c-1"
alias phpserver="php -S localhost:8080"

alias whatismyip="curl ifconfig.me"
alias myip="curl ifconfig.me"

function print_rainbow() {
  # print rainbow
  yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .1; done
}

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
  echo "    ws           : local web server with per project basis configuration"
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
  echo "    logstalgia   : Visualize HTTP Traffic"
  echo "    gource       : Visualize source code building timelapse"
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
  echo "    hostile      : change /etc/hosts file"
  echo "=========================================================================="
  echo "    af           : app frog"
  echo "    heroku       : heroku"
  echo "=========================================================================="
  echo "    youtubedl    : @param youtube id or link"
  echo "   spotify-to-mp3: e.g. echo 'name of the song' | spotify-to-mp3"
  echo "    unzip        : @param path"
  echo "=========================================================================="
  echo " t, ti, grep, fgrep, egrep, curl, flush_dns, nano, pwd, ll, forgot"
  echo " mdfind : uses spotlight's database with metadata toos"
  echo " archey -c : about this mac alias hello"
  echo " banner/figlet : print some ascii art"
  echo " cheat/man: cheat sheet or manual"
  echo "=========================================================================="
  echo " top/vtop : monitor memory"
  echo " kill {id} : kill a process"
  echo " fix_open_with_duplicate"
  echo " rsync scp sftp : rsync|scp|sftp {username@host:from} {username@host:to}"
  echo "=========================================================================="
}

alias hello="archey -c"
alias aboutthismac="archeyjs -c"

alias ah="forgot"
alias tool="forgot"
alias tools="forgot"

##
# Your previous /Users/kentliau/.bash_profile file was backed up as /Users/kentliau/.bash_profile.macports-saved_2014-03-03_at_18:46:34
##

# MacPorts Installer addition on 2014-03-03_at_18:46:34: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/kentliau/.bash_profile file was backed up as /Users/kentliau/.bash_profile.macports-saved_2014-08-14_at_06:17:13
##

# MacPorts Installer addition on 2014-08-14_at_06:17:13: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
