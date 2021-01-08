# history
## ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
## プロンプト複数起動時のhistory共有
setopt share_history
## 重複するコマンドのhistory削除
setopt hist_ignore_all_dups
## スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
## historyコマンドは履歴に登録しない
setopt hist_no_store
## 余分な空白は詰めて記録
setopt hist_reduce_blanks
## 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
## メモリに保存される履歴の件数
export HISTSIZE=1000

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval "$(starship init zsh)"

autoload -U compinit && compinit

