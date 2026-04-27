# export PATH="/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/miniconda3/condabin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PS1="%~ %# "

source ~/.zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme

# fuzzy-finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Plugin: zsh-autosuggestions
source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Plugin: zsh-syntax-highlighting
source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
. ~/.zsh-plugins/z/z.sh

# Load zsh-vi-mode
# source ~/.zsh-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# display ascii image
# cat ~/maydelc.txt

# map clear command to juce 'c'
alias c='clear'

# map ls to ls -G by default : show color coding for files and folders
# alias ls='ls -G'
alias ls='lsd'
alias lst1='lsd --tree --depth=1'
alias lst2='lsd --tree --depth=2'
alias lst3='lsd --tree --depth=3'
alias lst='lsd --tree --depth=1'

# directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias v='nvim'
alias ~='cd ~'

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# display ascii after every clear
# clear() {
#   command clear
#   if [[ -f ~/maydelc.txt ]]; then
#     while IFS= read -r line; do
#       echo "$line"
#       sleep 0.05  # Adjust speed: 0.05 = fast, 0.1 = slower
#     done < ~/maydelc.txt
#   fi
# }
#
# clear


export PATH="$HOME/.local/bin:$PATH"

# Task Master aliases added on 8/11/2025
alias tm='task-master'
alias taskmaster='task-master'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/savi/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/savi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/savi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/savi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# yt-dlp and mpv enable command 'play': streams song from youtube
play() {
    titles=()
    ids=()

    while IFS= read -r line; do
        title=$(echo "$line" | cut -f1)  # first field = title
        id=$(echo "$line" | cut -f2)     # second field = id
        titles+=("$title")
        ids+=("$id")
    done < <(yt-dlp "ytsearch5:$*" \
        --print "%(title)s\t%(id)s" \
        --default-search "ytsearch" \
        --skip-download --quiet --no-warnings)

    if [ ${#titles[@]} -eq 0 ]; then
        echo "No results found for '$*'"
        return 1
    fi

    echo "Choose a song (Enter for first result):"
    select choice in "${titles[@]}"; do
        if [ -z "$REPLY" ]; then
            mpv --no-video "https://www.youtube.com/watch?v=${ids[0]}"
            break
        elif [[ "$REPLY" =~ ^[0-9]+$ ]] && [ "$REPLY" -ge 1 ] && [ "$REPLY" -le ${#ids[@]} ]; then
            index=$(( REPLY - 1 ))
            mpv --no-video "https://www.youtube.com/watch?v=${ids[$index]}"
            break
        else
            echo "Invalid choice."
        fi
    done
}
export GOOGLE_CLOUD_PROJECT="tokyo-equator-467802-n8"
export PATH="/usr/local/texlive/2025basic/bin/universal-darwin:$PATH"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export CMAKE_PREFIX_PATH="/opt/homebrew/opt/llvm"
export CC=/opt/homebrew/opt/llvm/bin/clang
export CXX=/opt/homebrew/opt/llvm/bin/clang++

# OpenClaw Completion
source "/Users/savi/.openclaw/completions/openclaw.zsh"

# force non-vim mode
bindkey -e
