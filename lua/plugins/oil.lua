return {
  "stevearc/oil.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("oil").setup({})
  end,
}