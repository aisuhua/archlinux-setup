# start new terminal in last directory
. /etc/profile.d/vte.sh

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='\[\e[0;35m\]\u\[\e[1;30m\]@\[\e[1;37m\]\h \[\e[0;32m\]\W \[\e[1;00m\]$\[\e[0m\] '
PS1='\[\e[0;35m\]\u\[\e[1;31m\] \W \[\e[1;00m\]$\[\e[0m\] '

# do not put in history if starts with space
export HISTCONTROL=ignorespace
export EDITOR=vim
export PATH="/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:~/.local/bin"

alias j='jobs'
alias f='fg'
alias l='ls --color=auto'
alias tj='journalctl -xr -S today -U tomorrow'      # today journal

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mocp='mocp --music-dir --theme=transparent-background'
alias pandoc='pandoc --variable urlcolor=cyan'

# network-manager (see: *nmcli* for more)
alias qnm='systemctl status NetworkManager'
alias jnm='journalctl -rxt NetworkManager'
alias rnm='sudo systemctl restart NetworkManager'
alias cnm='sudo vim /etc/NetworkManager/NetworkManager.conf'

# various opt
alias burp='java -jar -Xmx512m ~/opt/burpsuite_free_v1.6.01.jar &'
alias sublime='~/opt/sublime_text_3/sublime_text'
alias mermaid='~/opt/node_modules/mermaid/bin/mermaid.js'
alias text2pdf='~/opt/text2pdf/./text2pdf -s11 -v15'

# language
alias fr='sdcv -u "Dictionnaire de l’Académie Française, 6ème édition (1835)."'
alias en='sdcv -u "WordNet"'
# note: set before with 'sdcv --data-dir ~/.stardict/dic/'

# clipboard interactions
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# handy
alias shred='shred -vzun 50'    # truly nuke a file
alias catwn='tail -n +1'        # cat [w]ith file[n]ames
alias php2html='wget --convert-links --mirror --adjust-extension'

# dev life
alias kring='killall {dring,gnome-ring}'
alias dring='SIPLOGLEVEL=0 AVLOGLEVEL=0 RING_TLS_LOGLEVEL=0 dring'

# removes git push gnome widget
unset SSH_ASKPASS

# wiki-browser-html
export wiki_browser=firefox

# welcome ascii drawing with text
RANDOM=$$$(date +%s)
COWS=($(basename --suffix=.cow $(ls -1 /usr/share/cows)))
COW=$(echo ${COWS[RANDOM % ${#COWS[@]}]})
cowsay -f $COW $(fortune); echo

# paste it
function sprunge()
{
    "$@" | curl -F 'sprunge=<-' http://sprunge.us
}

function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

now_date=$(date +%d-%m-%Y)

function image2usb()
{
    # $1 = image; $2 = sdx
    sudo dd bs=4M if=$1 of=$2 status=progress && sync
}

function mov2mp4()
{
    # $1 = input; $2 = output
    ffmpeg -i $1 -f mp4 -vcodec copy -acodec copy $2
}

function rmfexts()
{
    # $1 = extension; $@ (rest) = files
    local suffix=$1;
    shift;
    for f in $($@); do
        echo $(basename --suffix $suffix $f)
        mv $f $(basename --suffix $suffix $f);
    done
}

