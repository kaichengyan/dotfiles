alias ls='ls --color'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementatio
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias qfind="find . -name "                 # qfind:    Quickly search for file
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias shortdate="date +%Y%m%d%H%M%S"

alias ca="conda activate"

if [[ "$(uname)" == "Darwin" ]]; then
    alias vi="mvim -v"
    alias vim="mvim -v"
fi

ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

# better zz from fasd
zz() {
  local dir
  dir="$(fasd -Rdl "$*" | fzf --query="$*" -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# Usage: fv file pattern
fv() {
  local file
  file="$(fzf --exact --height 40% --reverse --query="$1"  --select-1 --exit-0)"
  [[ -n "$file" ]] && vim "$file"
}
