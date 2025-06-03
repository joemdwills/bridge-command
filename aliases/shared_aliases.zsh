
#   -------------------------------
#   General Exports
#   -------------------------------

SCRIPT_DIR=$(dirname "$(dirname "$SHARED_PROFILE_PATH")") # Get the parent directory of the current script (shared_aliases.zsh)
export SCRIPT_DIR

DOTFILES_DIR="$SCRIPT_DIR/dotfiles_and_settings"
export DOTFILES_DIR

SCRIPTS_DIR="$SCRIPT_DIR/scripts" # Define the path to scripts directory
export SCRIPTS_DIR

#   -------------------------------
#   General Aliases
#   -------------------------------

alias hello="$SCRIPTS_DIR/hello.sh; reloadprofile"
alias backup="$SCRIPTS_DIR/backup.sh"

alias add="git add ."
alias commit="git commit"
alias delete-derived-data="python3 $SCRIPTS_DIR/xcode_delete_derived_data.py"
alias deleteMergedBranches='git branch --merged | egrep -v "(^\*|master|main|dev|develop)" | xargs git branch -d'
alias editprofile='open ~/.zshrc'
alias editsharedprofile='open ${SHARED_PROFILE_PATH}'	
alias f='open .'
alias fork='open -a Fork ./'
alias glog="git log --oneline --decorate --graph"
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'	
alias oa="python3 $SCRIPTS_DIR/android_studio_open.py"
alias ov="code ."
alias ox="python3 $SCRIPTS_DIR/xcode_open.py"
alias pr-open="gh pr view --web"
alias pull='git pull'
alias push='git push'
alias refresh-ignore='git rm -r --cached . && git add .'
alias reloadprofile='source ~/.zshrc'
alias rename_docs="python3 $SCRIPTS_DIR/rename_document.py"
alias screen-recording="osascript $SCRIPTS_DIR/new_screen_recording.scpt"
alias scripts="cd $SCRIPT_DIR"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias snippets='cd ~/Library/Developer/Xcode/UserData/CodeSnippets'
alias switch-and-pull="bash $SCRIPTS_DIR/switch_and_pull.sh"

#   -------------------------------
#   Work Specific Aliases
#   -------------------------------

if [[ "$ENVIRONMENT" == "work" ]]; then
  WORK_ALIAS_PATH="$SCRIPT_DIR/aliases/work_aliases.zsh"
  alias edit-work-profile='open ${WORK_ALIAS_PATH}'	
  source $WORK_ALIAS_PATH
fi

#   -------------------------------
#   Pyenv (as per https://github.com/pyenv/pyenv?tab=readme-ov-file#zsh)
#   -------------------------------

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

#   -------------------------------
#   ZSH Related Settings
#   -------------------------------

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme and appearance
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh