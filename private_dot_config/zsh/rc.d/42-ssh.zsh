# ssh 系コマンドの補完を ~/.ssh/config の Host 中心に整える

# user@host のユーザー名補完で macOS のシステムアカウント (_accessoryupdater 等)
# が大量に出るのを抑制し、ログインユーザーと root のみを候補にする
zstyle ':completion:*:(ssh|scp|sftp|rsync|mosh|ssh-copy-id):*' users "$USER" root

# ~/.ssh/config の Host エントリを補完候補のホストとして登録する。
# - 1 行に複数ホスト名 (Host web1 web2) があれば各々を候補化
# - ワイルドカードを含む Host (* や ?) はテンプレート定義なので除外
# これにより /etc/hosts や mDNS など外部由来のホストが混ざらなくなる
if [[ -r "$HOME/.ssh/config" ]]; then
  _ssh_config_hosts=(${(z)${(M)${(f)"$(<"$HOME/.ssh/config")"}:#[Hh]ost *}#[Hh]ost })
  _ssh_config_hosts=(${_ssh_config_hosts:#*[*?]*})
  zstyle ':completion:*:hosts' hosts $_ssh_config_hosts
  unset _ssh_config_hosts
fi
