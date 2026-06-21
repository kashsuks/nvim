return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    treesitter_configs.setup({
      ensure_installed = { "lua", "python", "vim", "vimdoc", "svelte", "javascript", "typescript", "html", "css" },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
