# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
stty -ixon

alias rm='rm -i'
alias ssh='ssh -X -C'

# =========== Local to Dev ===========
export CUR_BE="be_news"
export CUR_BRANCH="unit_test"
export CUR_REMOTE="origin"
export TEST_CONTROLLER_DIR="/home/marshall.hung/HomeSecurity_BEs/be_news/spec/controllers"
export TEST_MODEL_DIR="/home/marshall.hung/HomeSecurity_BEs/be_news/spec/models"
export TEST_REQUEST_DIR="/home/marshall.hung/HomeSecurity_BEs/be_news/spec/requests"

# alias gacp="gaa; git commit -m '[$CUR_BE][$CUR_BRANCH] revision'; git push $CUR_REMOTE $CUR_BRANCH" 
gacp() {
    git add .
    git commit -m "[$CUR_BE][$CUR_BRANCH] $1"
    git push $CUR_REMOTE $CUR_BRANCH
}

# =========== Dev test ==========
gpct() {
    git pull $CUR_REMOTE $CUR_BRANCH
    rspec TEST_CONTROLLER_DIR
}
gpmt() {
    git pull $CUR_REMOTE $CUR_BRANCH
    rspec TEST_MODEL_DIR
}
gprt() {
    git pull $CUR_REMOTE $CUR_BRANCH
    rspec TEST_REQUEST_DIR
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
plugins=(git rails rvm rake autojump)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

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
#
# This shell prompt config file was created by promptline.vim
#
function __promptline_host {
  local only_if_ssh="0"

  if [ ! $only_if_ssh -o -n "${SSH_CLIENT}" ]; then
    if [[ -n ${ZSH_VERSION-} ]]; then print %m; elif [[ -n ${FISH_VERSION-} ]]; then hostname -s; else printf "%s" \\h; fi
  fi
}

function __promptline_last_exit_code {

  [[ $last_exit_code -gt 0 ]] || return 1;

  printf "%s" "$last_exit_code"
}
function __promptline_ps1 {
  local slice_prefix slice_empty_prefix slice_joiner slice_suffix is_prompt_empty=1

  # section "a" header
  slice_prefix="${a_bg}${sep}${a_fg}${a_bg}${space}" slice_suffix="$space${a_sep_fg}" slice_joiner="${a_fg}${a_bg}${alt_sep}${space}" slice_empty_prefix="${a_fg}${a_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
  # section "a" slices
  __promptline_wrapper "$(__promptline_host)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # section "b" header
  slice_prefix="${b_bg}${sep}${b_fg}${b_bg}${space}" slice_suffix="$space${b_sep_fg}" slice_joiner="${b_fg}${b_bg}${alt_sep}${space}" slice_empty_prefix="${b_fg}${b_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
  # section "b" slices
  __promptline_wrapper "$USER" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # section "c" header
  slice_prefix="${c_bg}${sep}${c_fg}${c_bg}${space}" slice_suffix="$space${c_sep_fg}" slice_joiner="${c_fg}${c_bg}${alt_sep}${space}" slice_empty_prefix="${c_fg}${c_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
  # section "c" slices
  __promptline_wrapper "$(__promptline_cwd)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # section "y" header
  slice_prefix="${y_bg}${sep}${y_fg}${y_bg}${space}" slice_suffix="$space${y_sep_fg}" slice_joiner="${y_fg}${y_bg}${alt_sep}${space}" slice_empty_prefix="${y_fg}${y_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
  # section "y" slices
  __promptline_wrapper "$(__promptline_vcs_branch)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # section "warn" header
  slice_prefix="${warn_bg}${sep}${warn_fg}${warn_bg}${space}" slice_suffix="$space${warn_sep_fg}" slice_joiner="${warn_fg}${warn_bg}${alt_sep}${space}" slice_empty_prefix="${warn_fg}${warn_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
  # section "warn" slices
  __promptline_wrapper "$(__promptline_last_exit_code)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # close sections
  printf "%s" "${reset_bg}${sep}$reset$space"
}
function __promptline_vcs_branch {
  local branch
  local branch_symbol=" "

  # git
  if hash git 2>/dev/null; then
    if branch=$( { git symbolic-ref --quiet HEAD || git rev-parse --short HEAD; } 2>/dev/null ); then
      branch=${branch##*/}
      printf "%s" "${branch_symbol}$(git_super_status)"
      #printf "%s" "${branch_symbol}${branch:-unknown}"
      return
    fi
  fi
  return 1
}
function __promptline_cwd {
  local dir_limit="3"
  local truncation="⋯"
  local first_char
  local part_count=0
  local formatted_cwd=""
  local dir_sep="  "
  local tilde="~"

  local cwd="${PWD/#$HOME/$tilde}"

  # get first char of the path, i.e. tilde or slash
  [[ -n ${ZSH_VERSION-} ]] && first_char=$cwd[1,1] || first_char=${cwd::1}

  # remove leading tilde
  cwd="${cwd#\~}"

  while [[ "$cwd" == */* && "$cwd" != "/" ]]; do
    # pop off last part of cwd
    local part="${cwd##*/}"
    cwd="${cwd%/*}"

    formatted_cwd="$dir_sep$part$formatted_cwd"
    part_count=$((part_count+1))

    [[ $part_count -eq $dir_limit ]] && first_char="$truncation" && break
  done

  printf "%s" "$first_char$formatted_cwd"
}
function __promptline_left_prompt {
  local slice_prefix slice_empty_prefix slice_joiner slice_suffix is_prompt_empty=1

  # section "a" header
  slice_prefix="${a_bg}${sep}${a_fg}${a_bg}${space}" slice_suffix="$space${a_sep_fg}" slice_joiner="${a_fg}${a_bg}${alt_sep}${space}" slice_empty_prefix="${a_fg}${a_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
  # section "a" slices
  __promptline_wrapper "$(__promptline_host)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # section "b" header
  slice_prefix="${b_bg}${sep}${b_fg}${b_bg}${space}" slice_suffix="$space${b_sep_fg}" slice_joiner="${b_fg}${b_bg}${alt_sep}${space}" slice_empty_prefix="${b_fg}${b_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
  # section "b" slices
  __promptline_wrapper "$USER" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # section "c" header
  slice_prefix="${c_bg}${sep}${c_fg}${c_bg}${space}" slice_suffix="$space${c_sep_fg}" slice_joiner="${c_fg}${c_bg}${alt_sep}${space}" slice_empty_prefix="${c_fg}${c_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
  # section "c" slices
  __promptline_wrapper "$(__promptline_cwd)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

  # close sections
  printf "%s" "${reset_bg}${sep}$reset$space"
}
function __promptline_wrapper {
  # wrap the text in $1 with $2 and $3, only if $1 is not empty
  # $2 and $3 typically contain non-content-text, like color escape codes and separators

  [[ -n "$1" ]] || return 1
  printf "%s" "${2}${1}${3}"
}
function __promptline_right_prompt {
  local slice_prefix slice_empty_prefix slice_joiner slice_suffix

  # section "warn" header
  slice_prefix="${warn_sep_fg}${rsep}${warn_fg}${warn_bg}${space}" slice_suffix="$space${warn_sep_fg}" slice_joiner="${warn_fg}${warn_bg}${alt_rsep}${space}" slice_empty_prefix=""
  # section "warn" slices
  __promptline_wrapper "$(__promptline_last_exit_code)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }

  # section "y" header
  slice_prefix="${y_sep_fg}${rsep}${y_fg}${y_bg}${space}" slice_suffix="$space${y_sep_fg}" slice_joiner="${y_fg}${y_bg}${alt_rsep}${space}" slice_empty_prefix=""
  # section "y" slices
  __promptline_wrapper "$(__promptline_vcs_branch)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }

  # close sections
  printf "%s" "$reset"
}
function __promptline {
  local last_exit_code="${PROMPTLINE_LAST_EXIT_CODE:-$?}"

  local esc=$'[' end_esc=m
  if [[ -n ${ZSH_VERSION-} ]]; then
    local noprint='%{' end_noprint='%}'
  elif [[ -n ${FISH_VERSION-} ]]; then
    local noprint='' end_noprint=''
  else
    local noprint='\[' end_noprint='\]'
  fi
  local wrap="$noprint$esc" end_wrap="$end_esc$end_noprint"
  local space=" "
  local sep=""
  local rsep=""
  local alt_sep=""
  local alt_rsep=""
  local reset="${wrap}0${end_wrap}"
  local reset_bg="${wrap}49${end_wrap}"
  local a_fg="${wrap}38;5;220${end_wrap}"
  local a_bg="${wrap}48;5;166${end_wrap}"
  local a_sep_fg="${wrap}38;5;166${end_wrap}"
  local b_fg="${wrap}38;5;231${end_wrap}"
  local b_bg="${wrap}48;5;31${end_wrap}"
  local b_sep_fg="${wrap}38;5;31${end_wrap}"
  local c_fg="${wrap}38;5;250${end_wrap}"
  local c_bg="${wrap}48;5;240${end_wrap}"
  local c_sep_fg="${wrap}38;5;240${end_wrap}"
  local warn_fg="${wrap}38;5;231${end_wrap}"
  local warn_bg="${wrap}48;5;52${end_wrap}"
  local warn_sep_fg="${wrap}38;5;52${end_wrap}"
  local y_fg="${wrap}38;5;250${end_wrap}"
  local y_bg="${wrap}48;5;236${end_wrap}"
  local y_sep_fg="${wrap}38;5;236${end_wrap}"
  if [[ -n ${ZSH_VERSION-} ]]; then
    PROMPT="$(__promptline_left_prompt)"
    RPROMPT="$(__promptline_right_prompt)"
  elif [[ -n ${FISH_VERSION-} ]]; then
    if [[ -n "$1" ]]; then
      [[ "$1" = "left" ]] && __promptline_left_prompt || __promptline_right_prompt
    else
      __promptline_ps1
    fi
  else
    PS1="$(__promptline_ps1)"
  fi
}

if [[ -n ${ZSH_VERSION-} ]]; then
  if [[ ! ${precmd_functions[(r)__promptline]} == __promptline ]]; then
    precmd_functions+=(__promptline)
  fi
elif [[ -n ${FISH_VERSION-} ]]; then
  __promptline "$1"
else
  if [[ ! "$PROMPT_COMMAND" == *__promptline* ]]; then
    PROMPT_COMMAND='__promptline;'$'\n'"$PROMPT_COMMAND"
  fi
fi


source ~/.zsh-git-prompt/zshrc.sh
