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

vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})

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

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open lazy git" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
