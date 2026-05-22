-- snacks.picker: dotfile/gitignore対象 (.claude, tmp 等) も検索対象に含める
-- ノイズになりやすいビルド成果物・依存ディレクトリは exclude で除外
local picker_exclude = {
  "node_modules",
  ".git",
  "dist",
  "build",
  ".next",
  ".nuxt",
  ".cache",
  ".turbo",
  ".venv",
  "__pycache__",
  "target",
  "vendor",
}

return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = picker_exclude,
        },
        grep = {
          hidden = true,
          ignored = true,
          exclude = picker_exclude,
        },
      },
    },
  },
}
