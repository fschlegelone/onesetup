return {
  "nvim-lua/plenary.nvim",
  config = function()
    local async = require("plenary.async")
    local job = require("plenary.job")
    local scan = require("plenary.scandir")
  end
}
