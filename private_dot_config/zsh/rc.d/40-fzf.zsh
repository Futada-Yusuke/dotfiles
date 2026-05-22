# fzf 本体 + デフォルトオプション

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ctrl+T のファイル選択を fd ベースに
export FZF_CTRL_T_COMMAND='fd --type f --hidden --follow --exclude .git'

# Ctrl+T プレビュー: バイナリは表示せず、テキストは bat でハイライト
export FZF_CTRL_T_OPTS="
  --height 40%
  --reverse
  --preview '
    if file --mime {} | grep -q binary; then
      echo Binary file
    else
      bat --style=numbers --color=always --line-range :200 {}
    fi
  '
"
