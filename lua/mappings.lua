require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("n", "<C-p>", ":FloatermToggle<CR>", { silent = true })

vim.keymap.set("n", "<C-t>", function()
  require("menu").open "default"
end, {})

vim.keymap.set("n", "<C-y>", function()
  require("triforce").show_profile()
end, { desc = "tampilkan triforce stats" })

map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds " })
map("n", "zc", "zc", { desc = "Close fold under cursor" })
map("n", "zo", "zo", { desc = "Open fold under cursor" })
map("n", "za", "za", { desc = "Toggle fold under cursor" })

map("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Peek fold or LSP hover" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
