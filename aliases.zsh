# shortcuts
alias back='cd "$OLDPWD"'
alias c="clear"

# macOS
alias finder="open -a Finder"
alias safari="open -a Safari"
alias typora="open -a Typora"
alias preview="open -a Preview"

# zsh
alias zshsrc="source ~/.zshrc"
alias zshaliases="vi ~/.dotfiles/zsh/aliases.zsh"
alias zshconf="vi ~/.dotfiles/zsh/.zshrc"
alias zshexports="vi ~/.dotfiles/zsh/exports.zsh"
alias zshfuncs="vi ~/.dotfiles/zsh/functions.zsh"
alias zshpaths="vi ~/.dotfiles/zsh/paths.zsh"

# terminal
alias alacrittyconf="vi ~/.dotfiles/alacritty/alacritty.yml"

# tmux
alias tmuxconf="vi ~/.tmux.conf.local"

# editor
alias vi="nvim"
alias vim="nvim"

# window manager
alias yabaiconf="vi ~/.yabairc"
alias skhdconf="vi ~/.skhdrc"
alias wmstart="brew services start yabai; brew services start skhd;"
alias wmrestart="brew services restart yabai; brew services restart skhd;"
alias wmstop="brew services stop yabai; brew services stop skhd;"

# blasphemy?
if command -v exa > /dev/null; then
    alias ls="exa"
    alias ll="exa -l"
    alias la="exa -a"
    alias l="exa -la"
fi
