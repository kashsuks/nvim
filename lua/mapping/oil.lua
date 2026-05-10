-- Oil mappings
local ok, oil = pcall(require, "oil")
if ok then
  vim.keymap.set("n", "-", function()
    oil.open()
  end, { noremap = true, silent = true, desc = "Oil: open parent directory" })
end