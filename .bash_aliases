# Misc
alias ls='ls --color=auto'
alias l='ls'
alias grep='grep --color=auto'
alias ip='ip -c'
alias cb="xclip -selection clipboard"
alias cat="batcat --pager=never"
alias genpass="~/.scripts/gen-pass.sh"
alias python='python3'

# Tmux
alias tn="tmux new -s $1"
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

# Docker
dsc() {
    # Start a specified docker container, attaching the CWD to it and dropping into /bin/bash.
    # dsc container
    docker run -it -v $(pwd):/x $1 /bin/bash
}
dscn() {
    docker run -it --net=bridge -v $(pwd):/x $1 /bin/bash
}
