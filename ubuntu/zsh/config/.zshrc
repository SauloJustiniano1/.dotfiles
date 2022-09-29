# Caminho para sua instalação oh-my-zsh.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# ------------------------------------------------------------------------------
#                                  configuration
# ------------------------------------------------------------------------------

SPACESHIP_FOOBAR_SHOW="${SPACESHIP_FOOBAR_SHOW=true}"
SPACESHIP_FOOBAR_ASYNC="${SPACESHIP_FOOBAR_ASYNC=true}"
SPACESHIP_FOOBAR_PREFIX="${SPACESHIP_FOOBAR_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_FOOBAR_SUFFIX="${SPACESHIP_FOOBAR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_FOOBAR_SYMBOL="${SPACESHIP_FOOBAR_SYMBOL="🚀 "}"
SPACESHIP_FOOBAR_COLOR="${SPACESHIP_FOOBAR_COLOR="white"}"

# Spaceshipt Prompt and Order
SPACESHIP_PROMPT_ORDER=(
  user          # Seção de nome de usuário
  dir           # Seção do diretório atual
  host          # Seção do nome do host
  git           # Seção Git (git_branch + git_status)
  hg            # Seção Mercurial (hg_branch  + hg_status)
  line_sep      # Quebra de linha
  jobs          # Indicador de jobs em segundo plano
  exit_code     # Seção de código de saída
  char          # Caractere de prompt

  package       # Package version
  node          # Seção Node.js
  php           # PHP section
  python        # Python section
  java          # Java section
  docker        # Seção do Docker
  aws           # Seção Amazon Web Services
  venv          # Seção virtualenv
  dotnet        # Seção .NET
  async         # Indicador de trabalhos Async < --- aviso não ativado

  # hg            # Seção Mercurial (hg_branch  + hg_status)
  # ruby          # Seção Ruby
  # terraform     # Seção do espaço de trabalho do Terraform
  # conda         # Seção conda virtualenv
  # kubectl       # Seção de contexto do Kubectl
  # elm           # Elm section
  # xcode         # Xcode section
  # elixir        # Elixir section
  # swift         # Swift section
  # golang        # Go section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Seção Julia
  # ibmcloud      # Seção IBM Cloud
  # gcloud        # Seção do Google Cloud Platform
  # time          # Seção de carimbos de hora
  # battery       # Nível e status da bateria
  # exec_time     # Tempo de execução
)
SPACESHIP_PROMPT_ADD_NEWLINE=false

# Exibir nome de usuário sempre
SPACESHIP_USER_SHOW=always

SPACESHIP_CHAR_SYMBOL="🚀❯"
SPACESHIP_CHAR_SUFFIX=" "

# Mostrar hora no prompt
SPACESHIP_TIME_SHOW=false

# Ativar Async (o padrão é True)
SPACESHIP_PROMPT_ASYNC=false

# Não truncar o caminho em repositórios
SPACESHIP_DIR_TRUNC_REPO=true

SPACESHIP_HOST_SHOW=true

# ------------------------------------------------------------------------------
#                                     section
# ------------------------------------------------------------------------------

# Show foobar status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_foobar() {
  # If SPACESHIP_FOOBAR_SHOW is false, don't show foobar section
  [[ $SPACESHIP_FOOBAR_SHOW == false ]] && return

  # Check if foobar command is available for execution
  spaceship::exists foobar || return

  # Show foobar section only when there are foobar-specific files in current
  # working directory.

  # spaceship::upsearch utility helps finding files up in the directory tree.
  local is_foobar_context="$(spaceship::upsearch foobar.conf)"
  # Here glob qualifiers are used to check if files with specific extension are
  # present in directory. Read more about them here:
  # http://zsh.sourceforge.net/Doc/Release/Expansion.html
  [[ -n "$is_foobar_context" || -n *.foo(#qN^/) || -n *.bar(#qN^/) ]] || return

  local foobar_version="$(foobar --version)"

  # Check if tool version is correct
  [[ $tool_version == "system" ]] && return

  # Display foobar section
  # spaceship::section utility composes sections. Flags are optional
  spaceship::section::v4 \
    --color "$SPACESHIP_FOOBAR_COLOR" \
    --prefix "$SPACESHIP_FOOBAR_PREFIX" \
    --suffix "$SPACESHIP_FOOBAR_SUFFIX" \
    --symbol "$SPACESHIP_FOOBAR_SYMBOL" \
    "$foobar_status"
}


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( 
  "robbyrussell" 
  "agnoster" 
)

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

# ------------------------------------------------------------------------------
# atualização
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

# Descomente a linha a seguir se colar URLs e outros textos estiver errado.
DISABLE_MAGIC_FUNCTIONS="false"

# Remova o comentário da linha a seguir para desabilitar as cores em ls
DISABLE_LS_COLORS="false"

# Descomente a linha a seguir para desabilitar o título do terminal de configuração automática
DISABLE_AUTO_TITLE="false"

# Descomente a seguinte linha se você quiser desabilitar a autocorreção de comando
DISABLE_CORRECTION="true"

# Remova o comentário da linha a seguir para habilitar a correção automática do comando
ENABLE_CORRECTION="true"

# ------------------------------------------------------------------------------
#                                  plugins
# ------------------------------------------------------------------------------

plugins=(
  git 
  zsh-syntax-highlighting
  zsh-autosuggestions
  k
)

source $ZSH/oh-my-zsh.sh
# source $ZSH/dotfiles/aliases

ulimit -n 2048

# ------------------------------------------------------------------------------
#                        configuração do usuário
# ------------------------------------------------------------------------------

export MANPATH="/usr/local/man:$MANPATH"

# Pode ser necessário definir manualmente seu ambiente de idioma
# Personalize de acordo com suas necessidades...
export LANG="pt_BR.UTF-8"
export LC_ALL="pt_BR.UTF-8"

# Editor preferido para sessões locais e remotas
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Caminhos caseiros
PATH=/usr/local/sbin:/usr/local/bin:$PATH

# ------------------------------------------------------------------------------
#                                    aliases
# ------------------------------------------------------------------------------

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias q="cd ../"
alias qq="cd ../../"
alias qqq="cd ../../../"
alias dev="cd ~/development"
alias cev="cd ~/development/curso-em-video"
alias rkt="cd ~/development/rocketseat"
alias git status='nocorrect git status'
alias vim='nocorrect vim'
