require "nvchad.options"

local M = {}

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
M.stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

vim.lsp.inlay_hint.enable(true, bufnr)

o.cursorlineopt = "both"
o.background = "dark"
vim.opt.relativenumber = true
vim.opt.list = true

vim.opt.listchars = {
  tab = "»·",
  eol = "↴",
  trail = "•",
  extends = "›",
  space = " ",
  lead = " ",
}
