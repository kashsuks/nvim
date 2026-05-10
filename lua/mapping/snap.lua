-- Key mappings for snap
local ok, snap = pcall(require, "snap")
if ok and snap and snap.config and snap.config.file then
  vim.keymap.set("n", "<Leader>ff", snap.config.file { producer = "ripgrep.file" }, { noremap = true, silent = true, desc = "Snap: file search" })
end