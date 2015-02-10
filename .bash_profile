#
#
#
# James Kerr's Bash Profile
# Created on January 30, 2014
#
#
#
#
alias updot="cd ~/.dotfiles && git pull && cd - && source .bash_profile"


#########################
# ::: ENV VARIABLES ::: #
#########################

# Colors
DEFAULT="\[\033[0m\]"
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
GRAY="\[\033[0;37m\]"


############################
# ::: USEFUL FUNCTIONS ::: #
############################

# Resource this file
alias reload!='source ~/.bash_profile'

# Navigating files
alias ll='ls -laGhp'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias f='open -a Finder ./'
alias ~="cd ~"
ql () { qlmanage -p "$*" >& /dev/null; }

# Modifying files
alias edit='subl'
alias mv='mv-iv'
alias cp='cp -iv'
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias mkdir='mkdir -pv' 
mcd () { mkdir -p "$1" && cd "$1"; }
trash () { command mv "$@" ~/.Trash; }
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Git
alias g='git status'

# Web Development
alias serve='php -S localhost:8000'

# SSH
alias copyssh='cat ~/.ssh/id_rsa.pub | pbcopy'

# Search the web
google () { open -a "Google Chrome" "https://google.com/search?q=$*"; }

# Ruby on Rails
migrate() { bundle exec rake db:migrate; bundle exec rake db:migrate RAILS_ENV=test; }


######################
# ::: THE PROMPT ::: #
######################

_git_branch_prompt() { 
	if git branch &> /dev/null; then
		local BRANCH=`git branch | grep \* | sed s/*\ //`
		if git status | grep "nothing to commit" &> /dev/null; then
			echo " (${GREEN}${BRANCH}${DEFAULT})"
		else
			echo " (${RED}${BRANCH}${DEFAULT})"
		fi
	else
		:
	fi
}

prompt_command() {
	local BRANCH=`_git_branch_prompt`
	export PS1="\! \W${BRANCH}${DEFAULT} > "
}

PROMPT_COMMAND=prompt_command 

############################
# ::: EXTERNAL SOURCES ::: #
############################

source ~/.bashrc

###########################
# ::: WELCOME MESSAGE ::: #
###########################

echo "::: The Shell Welcomes You :::"
