# 外部ツールの init (PATH や補完が揃ってから最後に読む)

# プロンプト
eval "$(starship init zsh)"

# zoxide: cd を頻度/最近性ベースのスマートジャンプに置き換える
# --cmd cd で `cd foo` が zoxide を経由するようになる
# 従来の cd が必要なときは `\cd` か `builtin cd` を使う
# 対話モード: cdi (= zi)

# cdi (対話モード) の fzf 表示を強化: ディレクトリ中身をプレビュー
# zoxide が fzf に渡す形式は "score path" のため、パスは {2..} で取る
export _ZO_FZF_OPTS="
  --height 45%
  --reverse
  --preview 'eza -la --icons --git --color=always {2..} 2>/dev/null | head -200'
  --preview-window=right:60%
"

eval "$(zoxide init zsh --cmd cd)"

# atuin: Ctrl+R を強化 (高機能な履歴検索 TUI に置き換え)
# --disable-up-arrow: 上矢印は zsh ネイティブの履歴スクロールのまま残す
eval "$(atuin init zsh --disable-up-arrow)"
