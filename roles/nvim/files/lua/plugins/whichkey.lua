return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 900 -- time whichkey opens after pressing leaderkey
  end,
  opts = {},
}
