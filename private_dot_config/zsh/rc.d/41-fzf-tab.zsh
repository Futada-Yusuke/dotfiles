# fzf-tab プラグイン固有の設定 (本体ロードは 30-zinit.zsh)

# ',' '.' でグループ間を切替
zstyle ':fzf-tab:*' switch-group ',' '.'

# fzf-tab 共通オプション
zstyle ':fzf-tab:*' fzf-flags \
  --height=40% \
  --reverse

# cd 補完時: 候補ディレクトリの中身を eza でプレビュー
zstyle ':fzf-tab:complete:cd:*' fzf-preview '
eza -la --icons --git --color=always $realpath | head -200
'

# ファイル/ディレクトリ系コマンドの共通 preview
zstyle ':fzf-tab:complete:(ls|cat|vim|nvim|code|less|bat):*' fzf-preview '
if [[ -d $realpath ]]; then
  eza -la --icons --git --color=always $realpath | head -200
else
  bat --style=numbers --color=always --line-range :200 $realpath 2>/dev/null || file $realpath
fi
'
