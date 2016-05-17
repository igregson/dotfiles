# ---------------------------------------------------
# Pure Prompt
# source:
# https://github.com/sindresorhus/pure#manually

fpath=( "$HOME/.zfunctions" $fpath )
autoload -U promptinit && promptinit

# pure prompt options
PURE_CMD_MAX_EXEC_TIME=10
prompt pure


# for better terminal emacs colors
export TERM=xterm-256color

#---------------------------------------------------
# Key Bindings

bindkey "^X^I" expand-or-complete-prefix

# bind UP and DOWN arrow keys -- z-history-substring-plugin
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# copy & paste shortcuts
alias "c=xclip"
alias "v=xclip -o"

# ---------------------------------------------------
# PATH

source ~/.phpbrew/bashrc

export GOPATH=$HOME/Web/Go
export NODE_PATH=/usr/local/lib/node_modules

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin:$HOME/npm/bin:$HOME/.rvm/bin:/usr/local/go/bin:$HOME/Web/Go/bin:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin

eval "$(rbenv init -)"

# ---------------------------------------------------
# Aliases

alias zreload=". $HOME/.zshrc && echo '[GOOD-NEWS] Z-Shell successfully reloaded!'" # Reload Z-Shell
alias zre="source $HOME/.zshrc && echo '[GOOD-NEWS] Z-Shell successfully reloaded!'"     # Reload Z-Shell
alias fontsreload="fc-cache -vf" # Clear Font Cache
alias zedit="vim ~/.zshrc"
alias i3edit="vim ~/.i3/config"

# cd
alias ..='cd ..'
alias ....='cd ../../'
alias ig='cd Web/ig.com'
alias themes='cd ~/Web/Theme-Dev'
alias blockster='cd ~/Web/Theme-Dev/t-Blockster'
alias blocksterwp='cd ~/Web/Theme-Dev/t-Blockster/Blockster-WP/wp-content/themes/blockster-wp'
alias codestead='cd ~/Web/theCodestead.com'
alias t-codestead='cd ~/Web/theCodestead.com/themes/codestead'
alias filethemes='cd ~/Web/FileThemes/FileThemes-Statamic-2/site/themes/filethemes-1'
alias ffh='cd ~/Web/FlatFileHub'
alias wes.com='cd ~/Web/for-Wesfed/wesfed-stat/wesfed.com'
alias zippy='cd ~/Web/for-Wesfed/zippyspot'
alias nextlevel='cd ~/Web/for-Wesfed/nextlevelkirby'
alias dutchman='cd ~/Web/for-Wesfed/dutchman'
alias stattracker='cd ~/Web/for-Wesfed/StatTracker/staticInitial'
alias ump='cd ~/Web/for-Fr.Peter/UMP/ump.com'
alias orthc='cd ~/Web/for-Fr.Peter/Orthodoxc/orthodoxc.com/site/themes/orthodoxc-1'
alias orthethos='cd ~/Web/for-Fr.Peter/OrthodoxEthos/orthodoxethos.com/site/themes/orthodoxethos-1'
alias beheard='cd ~/Web/beHeard/source'
alias wp-beheard='cd ~/Web/beHeard/plugin-wp/wp-content/plugins/beHeard'
alias akathists='cd ~/Web/akathists/akathists.com'
alias t-centio='cd ~/Web/Theme-Dev/t-Centio/source/content/themes/centio'

# li
alias lb='\ls --color=auto' # on preventing call to other alias: http://unix.stackexchange.com/questions/39291/run-a-command-that-is-shadowed-by-an-alias
alias lba='\ls -a --color=auto'
alias ls='ls -l --color=auto'
alias l='ls -l --color=auto'
alias ll='ls -al --color=auto'
alias la='ls -al --color=auto'

alias programs='\ls /usr/bin/' # for finding names of excutables

alias shortcuts='xfconf-query -c xfce4-keyboard-shortcuts -l -v | cut -d'"'"'/'"'"' -f4 | awk '"'"'{printf "%30s", $2; print "\t" $1}'"'"' | sort | uniq' 
# on the quote-maddness above:
# http://stackoverflow.com/questions/1250079/how-to-escape-single-quotes-within-single-quoted-strings

# open
alias -s com='google-chrome'

# ssh
alias sshpxk="ssh isaac@212.47.235.134"
alias sshpixelandkraft="ssh isaac@212.47.235.134"
alias sshpxkr="ssh root@212.47.235.134"
alias sshump="ssh orthodoxc@web514.webfaction.com"

# ---------------------------------------------------
# Plugins

source $HOME/.zplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zplugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.zplugins/zsh-tab-completion/completion.zsh
