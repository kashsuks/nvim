-- Telescope mappings
local ok, telescope_builtin = pcall(require, "telescope.builtin")
if ok then
  vim.keymap.set("n", "<Leader>ff", telescope_builtin.find_files, { noremap = true, silent = true, desc = "Telescope: find files" })
  vim.keymap.set("n", "<Leader>fg", telescope_builtin.live_grep, { noremap = true, silent = true, desc = "Telescope: live grep" })
end