return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "python", "vim", "vimdoc", "latex", "bibtex" },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    local ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end
    treesitter_configs.setup(opts)
  end,
}
