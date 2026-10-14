return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    servers = { "pyright", "texlab" },
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

    -- solargraph needs Ruby >= 3.1 but the global rbenv Ruby is 3.0.3,
    -- so it's installed under 3.4.9 instead of through Mason
    vim.lsp.config("solargraph", {
      cmd = { vim.fn.expand("~/.rbenv/versions/3.4.9/bin/solargraph"), "stdio" },
      capabilities = capabilities,
    })
    vim.lsp.enable("solargraph")
  end,
}
