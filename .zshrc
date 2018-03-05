source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
    git
    pip
    lein
    command-not-found
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-history-substring-search
EOBUNDLES

# Load the theme.
antigen theme refined

# Tell Antigen that you're done.
antigen apply

# Constantly needing this
autoload -U zcalc

# My Aliases
# =======================
source ~/.aliases


# export FZF_DEFAULT_OPTS='--height 50% --reverse --preview "pygmentize -g {}"'
export FZF_DEFAULT_OPTS='--height 50% --reverse'
export EDITOR=nvim
export VIEWER=nvim

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

fo() {
  local out file key
  # IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  IFS=$'\n' out=($(fzf --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

export DEFAULT_USER=tsiper
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# add this configuration to ~/.zshrc
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors
# bindkey -s "\C-r" "\eqhh\n"     # bind hh to Ctrl-r (for Vi mode check doc)


bindkey "^A"   beginning-of-line                    # ctrl-a
bindkey "^B"   backward-char                        # ctrl-b
bindkey "^E"   end-of-line                          # ctrl-e
bindkey "^F"   forward-char                         # ctrl-f
bindkey "^D"   delete-char                          # ctrl-d
bindkey "^K"   kill-whole-line                      # ctrl-k
bindkey "^N"   down-line-or-search                  # ctrl-n
bindkey "^P"   up-line-or-search                    # ctrl-p
bindkey "^R"   history-incremental-search-backward  # ctrl-r
bindkey "^[[B" history-search-forward               # down arrow
bindkey "^[[A" history-search-backward              # up arrow
bindkey '^h'   backward-delete-char
bindkey '^w'   backward-kill-word

# vim-style command-line
bindkey -M viins 'jk' vi-cmd-mode

# My aliases

# VI MODE that works
bindkey -v
bindkey '^?' backward-delete-char
bindkey '^r' history-incremental-search-backward


# precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1 %F{8}${SSH_TTY:+%n@%m}%f"

    zle reset-prompt
}

# zle-keymap-select () {
#     if [ $KEYMAP = vicmd ]; then
#         echo -ne "\e]50;CursorShape=0\a"  # block cursor
#     else
#         echo -ne "\e]50;CursorShape=1\a"  # vertical bar
#     fi
# }

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
