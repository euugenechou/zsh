#!/usr/bin/env bash

# Install oh-my-zsh.
if ! test -d "$HOME/.oh-my-zsh"; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zplug.
git clone "https://github.com/zplug/zplug" "$HOME/.zplug"

# Relink configuration.
rm -f "$PWD/.zshrc"
rm -f "$PWD/milktea.zsh-theme"
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/milktea.zsh-theme" "$HOME/.oh-my-zsh/themes/milktea.zsh-theme"
