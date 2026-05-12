return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright" },
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("pyright", {
      capabilities = capabilities,
    })
    vim.lsp.enable("pyright")
  end,
}
