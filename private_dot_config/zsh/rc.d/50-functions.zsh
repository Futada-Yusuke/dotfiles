# 自作関数 & キーバインド

# ghq + fzf でリポジトリへ即ジャンプ
function cdr() {
  local repo root
  root=$(ghq root)
  repo=$(
    ghq list | fzf \
      --preview "eza -la $root/{} --git --icons" \
      --height 40% \
      --reverse
  )
  [ -n "$repo" ] && cd "$root/$repo"
}

function cdr-widget() {
  zle push-line
  BUFFER="cdr"
  zle accept-line
}
zle -N cdr-widget
bindkey '^g' cdr-widget

# ホーム配下のよく使うディレクトリ + ghq + zoxide + fd を fzf で選択
function cdf() {
  local dir
  dir=$(
    {
      echo "$HOME"
      echo "$HOME/Desktop"
      echo "$HOME/Downloads"
      echo "$HOME/Documents"
      echo "$HOME/src"
      echo "$HOME/work"
      ghq list -p 2>/dev/null
      zoxide query -l 2>/dev/null
      fd . "$HOME" \
        --type d \
        --hidden \
        --follow \
        --exclude .git \
        --exclude Library \
        --exclude node_modules \
        --exclude .cache \
        --exclude .Trash \
        2>/dev/null
    } | awk '!seen[$0]++' |
      fzf \
        --height 45% \
        --reverse \
        --prompt='cd > ' \
        --preview 'eza -la --icons --git {} 2>/dev/null | head -200'
  )
  [ -n "$dir" ] && cd "$dir"
}
