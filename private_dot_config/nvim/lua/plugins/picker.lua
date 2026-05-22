-- snacks.picker: dotfileディレクトリ (.claude 等) を検索対象に含める
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
      },
    },
  },
}
