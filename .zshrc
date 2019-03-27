# ========== Environments ==========
export TERM=xterm-256color
export CUDA_HOME=/usr/local/cuda-7.0 
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64 
PATH=${CUDA_HOME}/bin:${PATH} 
export PATH
export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh installation.
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=$PATH:/usr/local/apache-maven-3.3.9/bin
export PATH=$PATH:/opt/gradle/gradle-5.2.1/bin #gradle
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_77.jdk/Contents/Home #/usr/java/jdk1.8.0_73
# ldev 8 make c code
#export PATH=$PATH:/home/y/bin:/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:/home/auction/bin
#umask 022
#export CVSROOT=vault.corp.yahoo.com:/CVSROOT
#export CVS_RSH=/usr/bin/ssh
#XMODIFIERS="@im=xcin"; export XMODIFIERS
#LANG=zh_TW.UTF-8; export LANG
#LANG=zh_TW.Big5; export LANG
#LC_CTYPE=en_US.ISO_8859-1; export LC_TYPE
#export LC_CTYPE=it_CH.ISO_8859-1
#MM_CHARSET=Big5; export MM_CHARSET
#MM_CHARSET=cp950; export MM_CHARSET
#LESSCHARSET=iso8859; export LESSCHARSET
#export  PATH=.:$PATH
#export  TERM=xterm-color
#export  YINST_DIST=dist.corp.tpc.yahoo.com
#export  EDITOR=vim
#export  VISUAL=vim
#export  OBJDIR=`uname -r|cut -f1 -d-`
#export ROOT=/home/y
#export ORACLE_HOME=$ROOT/libexec/oracle
#export TNS_ADMIN=$ROOT/conf/oracle
#export NLS_LANG=AMERICAN_AMERICA.ZHT16BIG5
#export NLS_DATE_FORMAT="YYYY/MM/DD HH24:MI:SS"
#========== Problem Fix ===========
stty -ixon
export LANG="en_US.UTF-8"
# ========== Alias ==========
alias rm='rm -i'
alias rycb='find /home/y/var/ycb/cache/ -name *.mdbm -or -name *.ysc -or -name *.lock |xargs -r -n 1 sudo rm;sudo rm /home/y/tmp/apc_user_cache.mdbm;sudo rm  /home/y/var/yrb/cache/.*;sudo rm  /home/y/var/run/yrb/cache/.*;sudo rm -rf /home/y/var/ycb/cache/*/.*;sudo rm -rf /home/y/var/run/ycb/cache/*/.*;sudo /home/y/bin64/ycbDbAdmin -c CLEANUP'
alias ryrb='sudo /home/y/bin64/yrbDbAdmin -c CLEANUP'
alias rapache='yinst restart yapache'
alias catsc='sh ~/catsc.sh'
alias lcache="logcat -f  /home/y/logs/trafficserver/squid.blog"
alias aerr='sudo tail -f /home/y/logs/yapache/error'  
alias aacc='sudo tail -f /home/y/logs/yapache/access | readlog -f url,status'  
alias ssh='ssh -X -C -A'
alias glg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''        %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"
alias gfr="git fetch upstream;git rebase upstream/master"
alias up='curl http://playground.yahoofs.com/auc/pkgs/ -H "x-ysws-version: 1.0" -H "Cache-Control: max-age=86400, public" -H "Content-Type: text/plain; charset=utf-8" -T'
# =========== Functions ===========
export TEST_CONTROLLER_DIR="/home/marshall.hung/workspace/HomeSecurity_BEs/be_news/spec/controllers"
export TEST_MODEL_DIR="/home/marshall.hung/workspace/HomeSecurity_BEs/be_news/spec/models"
export TEST_REQUEST_DIR="/home/marshall.hung/workspace/HomeSecurity_BEs/be_news/spec/requests"
gacp() {
    git add .
    git commit -m "$1"
    ggpush
}
gpct() {
    ggpull
    rspec TEST_CONTROLLER_DIR
}
gpmt() {
    ggpull
    rspec TEST_MODEL_DIR
}
gprt() {
    ggpull
    rspec TEST_REQUEST_DIR
}
ft() {
    grep --color -rs $1 *
}
ff() {
    find . -print | grep -i "$1"
}
rs() {
    rsync -avz $PWD wshung@latterchatter.corp.sg3.yahoo.com:~/Workspace --exclude=target --exclude=.idea --delete
}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump zsh-syntax-highlighting mvn)

# User configuration

source ~/.promptline_themes/promptline_goldenline.sh
source $ZSH/oh-my-zsh.sh
# source /usr/local/share/autojump/autojump.zsh 

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
source ~/.zsh-git-prompt/zshrc.sh

export SSH_AUTH_SOCK=/Users/wshung/.yubiagent/sock
