return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      transparent_background = false,
      term_colors = true,
      dim_inactive = { enabled = true, shade = "dark", percentage = 0.15 },
      styles = {
        comments = { "italic" },
        keywords = { "italic" },
        conditionals = { "italic" },
        functions = {},
        variables = {},
      },
      integrations = {
        cmp = true,
        treesitter = true,
        telescope = { enabled = true },
        noice = true,
        notify = true,
        snacks = { enabled = true },
        fidget = true,
        markview = true,
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            warnings = { "undercurl" },
            hints = { "underdotted" },
            information = { "underdotted" },
          },
        },
        indent_blankline = { enabled = true, colored_indent_levels = false },
      },
      custom_highlights = function(c)
        return {
          -- softer, floating-card feel for popups and splits
          FloatBorder = { fg = c.lavender, bg = c.mantle },
          NormalFloat = { bg = c.mantle },
          WinSeparator = { fg = c.surface0 },
          CursorLineNr = { fg = c.mauve, style = { "bold" } },
          Pmenu = { bg = c.mantle },
          PmenuSel = { bg = c.surface1, style = { "bold" } },
          CmpItemAbbrMatch = { fg = c.mauve, style = { "bold" } },
          CmpItemAbbrMatchFuzzy = { fg = c.mauve, style = { "bold" } },
          TelescopeBorder = { fg = c.lavender, bg = c.mantle },
          TelescopeSelection = { bg = c.surface0, style = { "bold" } },
        }
      end,
    })
    vim.cmd.colorscheme("catppuccin-frappe")
  end,
}
