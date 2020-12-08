# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-nvm)

# Cache directory
ZSH_COMPDUMP="${HOME}/.cache/zsh/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# English, please
export LANG=en_US.UTF-8

# Use nvm autouse
export NVM_AUTO_USE=true

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Dotfiles
export DOTFILES="$HOME/.dotfiles"

# Brew
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:$PATH"
alias ibrew='arch -x86_64 /usr/local/bin/brew'

# nodejs/npm
export NVM_AUTO_USE=true
export PATH="./node_modules/.bin:$PATH"

# yarn
if type "yarn" > /dev/null; then
    export PATH="`yarn global bin`:$PATH"
fi

# mkcert
if type "mkcert" > /dev/null; then
    export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"
fi

# Composer
export PATH="./vendor/bin:$HOME/.composer/vendor/bin:$PATH"

# Go
export GOPATH="$HOME/.go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# Preferred editor for local and remote sessions
export EDITOR='nano'

# Use exa as ls replacement
alias ls="exa -la"
alias la="exa -la"
alias ll="exa -la"

# Don't delete, trash it
alias rm="trash"

# Reload zsh
alias zshreload="source ~/.zshrc"

# Symfony
export PATH="$HOME/.symfony/bin:$PATH"

# Python3
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

# Rosetta
alias rosetta="arch -x86_64 zsh"
