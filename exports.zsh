# fzf
export FZF_DEFAULT_OPTS="--layout=reverse -m --bind ctrl-p:preview-up,ctrl-n:preview-down"

# bat
export BAT_THEME="ansi"

# rhea
if command -v brew > /dev/null; then
    export RHEA_UEFI_PATH="$(brew --prefix qemu)/share/qemu/edk2-aarch64-code.fd"
fi
