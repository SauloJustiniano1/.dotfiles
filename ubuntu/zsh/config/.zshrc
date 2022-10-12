# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------------------------------------------
#                                  settings
# ------------------------------------------------------------------------------
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ANDROID_HOME=~/Android/Sdk
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/.fastlane/bin:$PATH"

# ------------------------------------------------------------------------------
#                                  zsh theme
# ------------------------------------------------------------------------------
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# ------------------------------------------------------------------------------
#                               section - foobar
# ------------------------------------------------------------------------------
# Show foobar status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_foobar() {
  # Se SPACESHIP_FOOBAR_SHOW for falso, não mostre a seção foobar
  [[ $SPACESHIP_FOOBAR_SHOW == false ]] && return

  # Verifica se o comando foobar está disponível para execução
  spaceship::exists foobar || return

  # Mostra a seção foobar apenas quando há arquivos específicos do foobar no atual diretório de trabalho.

  # O utilitário spaceship::upsearch ajuda a encontrar arquivos na árvore de diretórios.
  local is_foobar_context="$(spaceship::upsearch foobar.conf)"

  # Aqui os qualificadores glob são usados para verificar se os arquivos com extensão específica são
  # presente no diretório. Leia mais sobre eles aqui:
  # http://zsh.sourceforge.net/Doc/Release/Expansion.html
  [[ -n "$is_foobar_context" || -n *.foo(qN^/) || -n *.bar(qN^/) ]] || return

  local foobar_version="$(foobar --version)"

  # Verifique se a versão da ferramenta está correta
  [[ $tool_version == "system" ]] && return

  # Exibe a seção foobar
  # o utilitário spaceship::section compõe as seções. As bandeiras são opcionais
  spaceship::section::v4 \
    --color "$SPACESHIP_FOOBAR_COLOR" \
    --prefix "$SPACESHIP_FOOBAR_PREFIX" \
    --suffix "$SPACESHIP_FOOBAR_SUFFIX" \
    --symbol "$SPACESHIP_FOOBAR_SYMBOL" \
    "$foobar_status"
}

# ------------------------------------------------------------------------------
#                                update
# ------------------------------------------------------------------------------
# Remova o comentário de uma das seguintes linhas para alterar o comportamento da atualização automática
# zstyle ':omz:update' mode disabled  # desabilitar atualizações automáticas
# zstyle ':omz:update' mode auto      # atualize automaticamente sem perguntar
# zstyle ':omz:update' mode reminder  # apenas me lembre de atualizar quando for a hora
# Remova o comentário da linha a seguir para alterar a frequência da atualização automática (em dias).
# zstyle ':omz:update' frequency 13

# ------------------------------------------------------------------------------
#                                system
# ------------------------------------------------------------------------------
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ------------------------------------------------------------------------------
#                                  plugins
# ------------------------------------------------------------------------------
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# ------------------------------------------------------------------------------
#                                  user configuration
# ------------------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh

# source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# ------------------------------------------------------------------------------
#                                    aliases
# ------------------------------------------------------------------------------
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

alias q="cd .."
alias qq="cd ../.."
alias qqq="cd ../../.."
alias dev="cd ~/development"
alias cev="cd ~/development/curso-em-video"
alias rkt="cd ~/development/rocketseat"
alias exp="explorer.exe ."

alias ls="exa --icons -lh" 
alias lt="exa --icons -lh --tree --level=2" 
alias ll="exa --icons -lha"

alias vim="nocorrect vim"
alias gitcache="git config --global credential.helper cache"
alias git status="nocorrect git status"

# alias ll="exa -l --icons -F -la"
# alias la="ls -A"
# alias l="ls -CF"
# alias ll="logo-ls -la" # Logo-ls
# alias ll="ls -alF" # Padrão

# ------------------------------------------------------------------------------
#                                    zsh
# ------------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# ------------------------------------------------------------------------------
#                                  spaceship
# ------------------------------------------------------------------------------
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="🚀❯"
SPACESHIP_CHAR_SUFFIX=" "

# Simplify prompt if we're using Hyper
if [[ "$TERM_PROGRAM" == "Hyper" ]]; then
  SPACESHIP_PROMPT_SEPARATE_LINE=false
  SPACESHIP_DIR_SHOW=false
  SPACESHIP_GIT_BRANCH_SHOW=false
fi

# ------------------------------------------------------------------------------
#                                  powerlevel10k
# ------------------------------------------------------------------------------
# source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
