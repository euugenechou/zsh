# Functions

function mkcd() {
    mkdir -p "$1" && cd "$1";
}

function chpwd() {
    emulate -L zsh
    ls -lh
}

function movtomp4() {
    ffmpeg -i "$@" -vcodec h264 -acodec aac "${@%.mov}.mp4"
}

function blockworld() {
    gcloud compute instances $1 blockworld --zone=us-west4-b
}

function isoburn() {
    dd if=$1 of=$2 bs=4m status=progress && sync
}

function windowsisbad() {
    if [[ $# -ne 3 ]]; then
        echo "usage: $0 <iso> <disk> <label>"
        return
    fi
    hdiutil mount $1
    hdiutil unmount $2
    diskutil eraseDisk MS-DOS $3 MBR $2
    rsync -vha --exclude=sources/install.wim /Volumes/CCCOMA_X64FRE_EN-US_DV9/ /Volumes/$3
    wimlib-imagex split /Volumes/CCCOMA_X64FRE_EN-US_DV9/sources/install.wim /Volumes/$3/sources/install.swm 3000
}

function keypass() {
    if [[ $# -lt 1 ]]; then
        echo "usage: $0 <name> [account]"
        return
    elif [[ -z $2 ]]; then
        security find-generic-password -s $1 -a "euchou" -g 2>&1 > /dev/null | awk -F\" '/password:/ { print $2 }' | tr -d '\n' | pbcopy
    else
        security find-generic-password -s $1 -a $2 -g 2>&1 > /dev/null | awk -F\" '/password:/ { print $2 }' | tr -d '\n' | pbcopy
    fi
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
function fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]ackage
function bip() {
    local inst=$(brew search "$@" | fzf -m)

    if [[ $inst ]]; then
        for prog in $(echo $inst);
        do; brew install $prog; done;
    fi
}

# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]ackage
function bup() {
    local upd=$(brew leaves | fzf -m)

    if [[ $upd ]]; then
        for prog in $(echo $upd);
        do; brew upgrade $prog; done;
    fi
}

# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]ackage (e.g. uninstall)
function bcp() {
    local uninst=$(brew leaves | fzf -m)

    if [[ $uninst ]]; then
        for prog in $(echo $uninst);
        do; brew uninstall $prog; done;
    fi
}

function dated() {
    if [[ $# -ne 1 ]]; then
        echo "usage: $0 <file>"
        return
    fi
    vi "$(date +%F)-$1"
}
