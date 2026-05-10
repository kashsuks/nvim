return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato",
            integrations = {
                lualine = true,
                nvimtree = true,
                telescope = true,
            },
        })

        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
}