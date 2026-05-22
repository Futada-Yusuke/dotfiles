# PATH 設定 (最初に読み込む)

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# Homebrew (Apple Silicon)
export PATH="/opt/homebrew/bin:$PATH"

# ユーザーローカル
export PATH="$HOME/.local/bin:$PATH"
