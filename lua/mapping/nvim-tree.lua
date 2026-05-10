-- nvim-tree mappings
local keymap = vim.keymap.set

-- Command+B to toggle nvim-tree on Mac
keymap("n", "<D-b>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
