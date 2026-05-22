# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理している個人用 dotfiles。

## 管理対象

| ソース | 宛先 | 内容 |
|--------|------|------|
| `dot_zshrc` | `~/.zshrc` | zsh ローダー |
| `private_dot_config/zsh/rc.d/` | `~/.config/zsh/rc.d/` | zsh 機能別設定 |
| `private_dot_config/brew/Brewfile` | `~/.config/brew/Brewfile` | Homebrew パッケージ |
| `private_dot_config/starship.toml` | `~/.config/starship.toml` | プロンプト |
| `dot_vimrc` | `~/.vimrc` | vim 設定 |
| `run_once_after_brew_setup.sh.tmpl` | (実行) | 初回 brew bundle bootstrap |

## 新しいマシンでのセットアップ

```bash
# 1. chezmoi をインストール
brew install chezmoi

# 2. このリポジトリを初期化 + apply
chezmoi init --apply git@github.com.bashaka:bashaka-futada/dotfiles.git
```

> `github.com.bashaka` は `~/.ssh/config` のホストエイリアス。新マシンでは SSH 鍵設定が先に必要。

## 日常運用

### 設定を編集する

```bash
# 方法A: 宛先ファイルを直接編集 → ソースに反映
vim ~/.config/zsh/rc.d/41-fzf-tab.zsh
chezmoi re-add ~/.config/zsh/rc.d/41-fzf-tab.zsh

# 方法B: ソースを編集 → 宛先に反映
chezmoi edit ~/.config/zsh/rc.d/41-fzf-tab.zsh
chezmoi apply
```

### 差分確認

```bash
chezmoi diff           # ソース vs 宛先の差分
chezmoi verify         # 一致なら exit 0
chezmoi managed        # 管理中ファイル一覧
```

### git で同期

```bash
chezmoi cd                                # ソースディレクトリへ移動
git status
git add -A && git commit -m "..." && git push
```

### 別マシンの変更を取り込む

```bash
chezmoi update         # git pull + apply を一括実行
```

## 新しいファイルを管理対象に追加

```bash
chezmoi add ~/.config/foo/bar.toml          # 通常
chezmoi add --template ~/.gitconfig         # テンプレート化
chezmoi add --encrypt ~/.ssh/some_secret    # 暗号化
```

## 管理対象から外す

```bash
# ソースから削除 (宛先ファイルは残す)
rm -rf ~/.local/share/chezmoi/path/to/source

# または
chezmoi forget ~/.config/foo
```

## Brewfile の更新

```bash
# 現在の brew 状態をダンプ
brew bundle dump --file=~/.config/brew/Brewfile --force --describe

# chezmoi ソースに取り込み
chezmoi re-add ~/.config/brew/Brewfile

# コミット & push
chezmoi cd
git add -A && git commit -m "update Brewfile" && git push
```

## ファイル命名規則 (chezmoi)

| プレフィックス | 意味 |
|---------------|------|
| `dot_` | `.` (ドットファイル) |
| `private_` | パーミッション 0600 系 (グループ/他者から非可視) |
| `executable_` | 実行可能 (`chmod +x`) |
| `run_once_after_` | 初回 apply 後に一度だけ実行 |
| `run_onchange_` | 内容変更時に再実行 |
| `.tmpl` | Go テンプレートとして処理 |

## トラブルシューティング

```bash
# 競合時にローカル変更を破棄してソースで上書き
chezmoi apply --force

# ソースの場所を確認
chezmoi source-path

# 設定 (~/.config/chezmoi/chezmoi.toml) を確認
chezmoi doctor
```
