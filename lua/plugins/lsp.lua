return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright" },
    })

    vim.lsp.config("pyright", {})
    vim.lsp.enable("pyright")
  end,
}
