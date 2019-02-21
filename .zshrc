
# dirs /usr/local/lib /usr/local /usr /var /var/log $HOME
 
source ~/.iterm2_shell_integration.zsh

ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle desyncr/auto-ls
antigen bundle git
antigen bundle mollifier/anyframe
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle ansiweather
antigen bundle horosgrisa/mysql-colorize
antigen bundle chrissicool/zsh-256color
if [ "$OSTYPE"="darwin16.0" ]; then
  antigen bundle osx
fi

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen theme amuse
antigen apply
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Advanced Aliases.
# Use with caution

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias gogacct='ssh webapp@10.7.31.107 -i ~/.ssh/id_rsa -v'
alias gogscn='ssh webapp@13.230.40.205 -i ~/.ssh/id_rsa -v'

alias zshrc='$EDITOR ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias whereami=display_info

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#self defined
alias weather='curl -4 wttr.in'
alias gg='googler -n 7 -l en -c jp'
alias rainfall='python /Users/ruofan.ye/Utility/getInstantWeather.py'
alias firekira='source /Users/ruofan.ye/kira/bin/activate'
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias mycurl='/usr/local/Cellar/curl/7.56.1/bin/curl'
# for powerline
#. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
if is-at-least 4.2.0; then
  # open browser on urls
  if [[ -n "$BROWSER" ]]; then
    _browser_fts=(htm html de org net com at cx nl se dk)
    for ft in $_browser_fts; do alias -s $ft=$BROWSER; done
  fi

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts; do alias -s $ft=$EDITOR; done

  if [[ -n "$XIVIEWER" ]]; then
    _image_fts=(jpg jpeg png gif mng tiff tif xpm)
    for ft in $_image_fts; do alias -s $ft=$XIVIEWER; done
  fi

  _media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts; do alias -s $ft=mplayer; done

  #read documents
  alias -s pdf=acroread
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
fi

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export GOPATH=/Users/ruofan.ye/go
export PATH="GOPATH:$GOPATH/bin:/usr/local/Cellar/vim/8.0.1200:/opt/local/bin:$PATH"


# for hub
eval "$(hub alias -s)"

# neovim
alias v='nvim'

export AWS_REGION=ap-northeast-1
export AWS_PROFILE=nativebase

## Set path for pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# drienv setting
export editor=nvim
eval "$(direnv hook zsh)"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash


# good to place at the end
# alias -g 0="cd ~0"
# alias -g 1="cd ~1"
# alias -g 2="cd ~2"
# alias -g 3="cd ~3"
# alias -g 4="cd ~4"
# alias -g 5="cd ~5"
# alias -g 6="cd ~6"
# alias -g 7="cd ~7"
# alias -g 8="cd ~8"
# alias -g 9="cd ~9"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
