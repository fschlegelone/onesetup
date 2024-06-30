return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local devicons = require("nvim-web-devicons")
    devicons.setup({
      color_icons = true,
      override_by_filename = {
        [".gitignore"] = {
          icon = "x",
          color = "#f38ba8",
          name = "gitignore",
        },
      },
    })
  end,
}
