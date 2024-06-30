return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {},
  main = "ibl",
  opts = {
    indent = {
      char = "┊",
    },
  },
}
