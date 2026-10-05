return {
  -- Syntax highlighting for web languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "json",
        "jsonc",
        "yaml",
        "graphql",
        "markdown",
        "markdown_inline",
        "bash",
      })
    end,
  },

  -- LSP servers for web languages (installed via Mason, configured via lsp.lua)
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, {
        "ts_ls",    -- TypeScript / JavaScript
        "html",     -- HTML
        "cssls",    -- CSS / SCSS / Less
        "svelte",   -- Svelte
        "jsonls",   -- JSON
        "emmet_ls", -- Emmet
        "graphql",  -- GraphQL
      })
    end,
  },
}
