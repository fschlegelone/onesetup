return {
  "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async"
    },
    -- -- -- -- -- 
    -- NVIM_UFO --
    -- -- -- -- --
    config = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      local nvim_ufo = require('ufo')
      nvim_ufo.setup()
      KEYMAP("n", "<leader>uu", nvim_ufo.openAllFolds)
      KEYMAP("n", "<leader>ux", nvim_ufo.closeAllFolds)
    end,
}
