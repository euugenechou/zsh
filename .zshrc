# theme
ZSH_THEME="milktea"

export ZSH=$HOME/.oh-my-zsh         # path to oh-my-zsh installation
export DOTFILES=$HOME/.dotfiles     # path to dotfiles
export LC_ALL=en_US.utf-8           # language stuff
export LANG="$LC_ALL"               # more language stuff
export EDITOR='nvim'                # the superior editor
export UPDATE_ZSH_DAYS=14           # updates are tolerated

# custom zsh directory
ZSH_CUSTOM=$DOTFILES/zsh

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# don't autocd
unsetopt autocd

# plugin manager
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

# plugins
zplug "wfxr/forgit", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "softmoth/zsh-vim-mode", defer:2

# install missing plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# load plugins
zplug load

# highlighting
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green,bold
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#676e7b'

# custom keybindings.
bindkey '^F' autosuggest-accept
bindkey ' ' magic-space
bindkey '^J' fzf-cd-widget
VIM_MODE_VICMD_KEY='jj'

# other stuff
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.nimble/env" ] && source "$HOME/.nimble/env"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
[ -f "$HOME/.gcloud/env" ] && source "$HOME/.gcloud/env"

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  export NIX_PATH="$HOME/.nix-defexpr"
fi

source /Users/eugene/.docker/init-zsh.sh || true # Added by Docker Desktop

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
