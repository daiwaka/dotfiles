PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) " # Linux bashと同じ形式
RPROMPT="%T" # 右側に時間表示
setopt transient_rprompt # 右側まで入力がきたら時間表示を消す
setopt prompt_subst # 変数展開など便利なプロント
#export LANG=ja_JP.UTF-8 # 日本語環境
export EDITOR=vim # エディタはvi
bindkey -v

# Color
autoload colors
colors

# Color at Prompt
PROMPT="%{${fg[green]}%}%n@%m %{${fg[yellow]}%}%~ %{${fg[red]}%}%# %{${reset_color}%}"
PROMPT2="%{${fg[red]}%} %_ > %{${reset_color}%}"
SPROMPT="%{${fg[yellow]}%}correct: %R -> %r ? [n,y,a,e] %{${reset_color}%}"

# Color at ls
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# lsがカラー表示になるようエイリアスを設定
case "${OSTYPE}" in
    darwin*)
    # Mac
    alias ls="ls -GF";;
    linux*)
    # Linux
    alias ls='ls -F --color';;
esac

# Complitation
autoload -U compinit # 補完機能
compinit -u # 補完を賢くする
setopt autopushd # cdの履歴表示、cd - で一つ前のディレクトリへ
setopt pushd_ignore_dups # 同ディレクトリを履歴に追加しない
setopt auto_cd # ディレクトリ名のみでcd
setopt list_packed # リストを詰めて表示
setopt list_types # 補完一覧をファイル種別に表示
setopt correct # コマンドのスペルチェックを有効に

# History
HISTFILE=~/.zsh_history # historyファイル
HISTFILESIZE=1000000
HISTSIZE=1000000 # ファイルサイズ
SAVEHIST=1000000 # saveする量
setopt hist_ignore_dups # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history # 履歴ファイルを共有
setopt EXTENDED_HISTORY # zshの開始終了を記録

# Move history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^R' history-incremental-search-backward
# alias
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#export PATH="$HOME/.linuxbrew/bin:$PATH"
#export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
#export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export PATH="$HOME/.anyenv/bin:$PATH"
#export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.plenv/bin:$PATH"
#export PATH="$HOME/.rbenv/bin:$PATH"
#export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(anyenv init -)"
#eval "$(pyenv init -)"
eval "$(plenv init -)"
#eval "$(rbenv init -)"
#eval "$(phpenv init -)"
[ -f ~/.zshrc.include ] && source ~/.zshrc.include # 設定ファイルのinclude
