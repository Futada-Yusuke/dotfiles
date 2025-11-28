if status is-interactive
    # Commands to run in interactive sessions can go here
    set PATH /opt/homebrew/bin $PATH
end
starship init fish | source

alias yolo="claude --dangerously-skip-permissions"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"


# fzf設定
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'

# fzfのデフォルトオプション
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'

# キーバインディングを有効化
if test -f ~/.fzf/shell/key-bindings.fish
    source ~/.fzf/shell/key-bindings.fish
end

# Added by Antigravity
fish_add_path ~/.antigravity/antigravity/bin
