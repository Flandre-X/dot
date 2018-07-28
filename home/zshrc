USE_OHMYZSH=false
USE_ZPLUG=true

if $USE_OHMYZSH; then
  export ZSH="$HOME/.oh-my-zsh"

  ZSH_THEME="robbyrussell"
  #ZSH_THEME="random"
  #ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

  #COMPLETION_WAITING_DOTS="true"

  # Uncomment the following line if you want to disable marking untracked files
  # under VCS as dirty. This makes repository status check for large repositories
  # much, much faster.
  #DISABLE_UNTRACKED_FILES_DIRTY="true"

  plugins=(
    git
  )

  source $ZSH/oh-my-zsh.sh
fi

if $USE_ZPLUG; then
  export ZPLUG_HOME="$HOME/.zplug"

  if [ ! -e "$ZPLUG_HOME" ]; then
    printf "Installing zplug..."
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  fi

  source "$ZPLUG_HOME/init.zsh"

  # Make sure to use double quotes
  #zplug "zsh-users/zsh-history-substring-search"

  # Use the package as a command
  # And accept glob patterns (e.g., brace, wildcard, ...)
  #zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

  # Can manage everything e.g., other person's zshrc
  #zplug "tcnksm/docker-alias", use:zshrc

  # Disable updates using the "frozen" tag
  #zplug "k4rthik/git-cal", as:command, frozen:1

  # Grab binaries from GitHub Releases
  # and rename with the "rename-to:" tag
  #zplug "junegunn/fzf-bin", \
      #from:gh-r, \
      #as:command, \
      #rename-to:fzf, \
      #use:"*darwin*amd64*"

  # Also prezto
  #zplug "modules/prompt", from:prezto

  # Load if "if" tag returns true
  #zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

  # Run a command after a plugin is installed/updated
  # Provided, it requires to set the variable like the following:
  # ZPLUG_SUDO_PASSWORD="********"
  #zplug "jhawthorn/fzy", \
      #as:command, \
      #rename-to:fzy, \
      #hook-build:"make && sudo make install"

  # Supports checking out a specific branch/tag/commit
  #zplug "b4b4r07/enhancd", at:v1
  #zplug "mollifier/anyframe", at:4c23cb60

  # Can manage gist file just like other packages
  #zplug "b4b4r07/79ee61f7c140c63d2786", \
      #from:gist, \
      #as:command, \
      #use:get_last_pane_path.sh

  # Support bitbucket
  #zplug "b4b4r07/hello_bitbucket", \
      #from:bitbucket, \
      #as:command, \
      #use:"*.sh"

  # Rename a command with the string captured with `use` tag
  #zplug "b4b4r07/httpstat", \
      #as:command, \
      #use:'(*).sh', \
      #rename-to:'$1'

  # Group dependencies
  # Load "emoji-cli" if "jq" is installed in this example
  #zplug "stedolan/jq", \
      #from:gh-r, \
      #as:command, \
      #rename-to:jq
  #zplug "b4b4r07/emoji-cli", \
      #on:"stedolan/jq"
  # Note: To specify the order in which packages should be loaded, use the defer
         #tag described in the next section

  # Set the priority when loading
  # e.g., zsh-syntax-highlighting must be loaded
  # after executing compinit command and sourcing other plugins
  # (If the defer tag is given 2 or above, run after compinit command)
  zplug "zsh-users/zsh-syntax-highlighting", defer:2

  # Can manage local plugins
  #zplug "~/.zsh", from:local

  zplug "mafredri/zsh-async", from:github
  zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

  # Oh My Zsh
  #zplug "themes/robbyrussel", from:oh-my-zsh, as:theme
  zplug "plugins/command-not-found", from:oh-my-zsh

  # Install plugins if there are plugins that have not been installed
  if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  zplug load
fi

# User configuration

export PATH="$HOME/.cargo/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export DOT="$HOME/.dot"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Preferred keybindings
# Emacs
bindkey -e
# Vim
#bindkey -v

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias vimconfig="$EDITOR ~/.config/nvim/plug.vim"
alias ls="ls --color=auto"

export MANPAGER="nvim -c 'set ft=man' -"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if command -v rg &>/dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2>/dev/null'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
elif [ ! -e ~/.fzf-no-ripgrep ]; then
  echo "FZF can use ripgrep for greater speed."
  echo "To install ripgrep, run the following commands:"
  echo -e "\tsudo apt install cargo"
  echo -e "\tcargo install ripgrep"
  echo
  echo "If you want to disable this message, run the following command:"
  echo -e "\ttouch ~/.fzf-no-ripgrep"
fi
