# ==============================================================================
#                                settings
# ==============================================================================

export ANDROID_HOME=~/Android/Sdk
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/.fastlane/bin:$PATH"

# ==============================================================================
#                                  plugins
# ==============================================================================

plugins=(
  git
  web-search
  colored-man-pages
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# ==============================================================================
#                        configuration - zshrc
# ==============================================================================

source $ZSH/oh-my-zsh.sh

# ==============================================================================
#                                  aliases
# ==============================================================================

alias zsh="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"

# =-=-=-=-=-=-=-=-=-=-=-=-=-= system -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
alias dev="~/development"
alias dvl="~/developer"

alias q="cd .."
alias qq="cd ../.."
alias qqq="cd ../../.."

alias file="xdg-open ."

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- docker -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
alias stopdocker="systemctl --user stop docker-desktop"
alias startdocker="systemctl --user start docker-desktop"

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- exa -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
alias ll="exa --icons -lha"
alias ls="exa --icons -lh" 
alias lt="exa --icons -lh --tree --level=2" 

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- git -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
alias gitcache="git config --global credential.helper cache"
alias gitstatus="nocorrect git status"

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=- web-search -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
alias g="google"
alias yt="youtube"

# ==============================================================================
#                                 starship
# ==============================================================================

eval "$(starship init zsh)"