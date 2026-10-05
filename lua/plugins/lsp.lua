return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    servers = { "pyright" },
  },
  config = function(_, opts)
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = opts.servers,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    for _, server in ipairs(opts.servers) do
      vim.lsp.config(server, { capabilities = capabilities })
      vim.lsp.enable(server)
    end
  end,
}
