# 補完システム初期化 (zinit/fzf-tab より前に必要)

autoload -Uz compinit
# .zcompdump が24時間以内なら高速モード (-C)
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# 補完メニューは fzf-tab が担当するので zsh 標準メニューは無効化
zstyle ':completion:*' menu no
# fzf-tab のグループ判定/色付けに使用
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
