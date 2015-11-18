# ========== Environments ==========
export CUDA_HOME=/usr/local/cuda-7.0 
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64 
PATH=${CUDA_HOME}/bin:${PATH} 
export PATH
export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh installation.
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# ========== Problem Fix ===========
stty -ixon
export LANG="en_US.UTF-8"
# ========== Alias ==========
alias rm='rm -i'
alias vim='sudo -E vim'
alias ryml='sudo /home/y/bin64/ycbDbAdmin -c CLEANUP'
alias rapache='yinst restart yapache'
alias catsc='sh ~/catsc.sh'
alias lcache="logcat -f  /home/y/logs/trafficserver/squid.blog"
alias aerr='sudo tail -f /home/y/logs/yapache/error'  
alias ssh='ssh -X -C'
alias glg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''        %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
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
ftext() {
    sudo find . -type f -exec grep "$1" {} +
}
ffile() {
    sudo find . -print | grep -i "$1"
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
plugins=(git rails rvm rake autojump zsh-syntax-highlighting)

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
