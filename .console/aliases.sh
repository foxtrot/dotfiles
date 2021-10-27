# Misc
alias ls='ls --color=auto'
alias l='ls'
alias grep='grep --color=auto'
alias ip='ip -c'
alias cb="xclip -selection clipboard"
alias cat="bat --pager=never"
alias genpass="~/.scripts/gen-pass.sh"

# Desktop Screenshare
alias castmiddle="vlc --no-video-deco --no-embedded-video --screen-fps=60 --screen-top=480 --screen-left=1080 --screen-width=3440 --screen-height=1440 screen://"
alias castleft="vlc --no-video-deco --no-embedded-video --screen-fps=60 --screen-top=0 --screen-left=0 --screen-width=1080 --screen-height=1920 screen://"
alias castright="vlc --no-video-deco --no-embedded-video --screen-fps=60 --screen-top=0 --screen-left=4520 --screen-width=1080 --screen-height=1920 screen://"

# Tmux
alias ta="tmux a -t $1"
alias tl="tmux ls"

# Open
alias open="xdg-open"

# Git
alias gs="~/.scripts/git-status-pretty.sh"
alias gl="git log --pretty=format:'%Cred%h%Creset %C(bold blue)%an%Creset %Cgreen%cr%Creset %s%C(bold red)%d%Creset'"
alias ga="git add"
alias gc="git commit"
alias gd="git diff --word-diff"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gsu="git submodule update --init --remote --recursive --force"

# Google Cloud
alias sqlconnect="cd ~ && ./cloud_sql_proxy -instances=hak5-dl:us-central1:download-portal=tcp:5432"

# Docker
dsc() {
    # Start a specified docker container, attaching the CWD to it and dropping into /bin/bash.
    # dsc container
    docker run -it -v $(pwd):/x $1 /bin/bash
}
dscn() {
    docker run -it --net=bridge -v $(pwd):/x $1 /bin/bash
}
