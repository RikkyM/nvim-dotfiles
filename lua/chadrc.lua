-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

vim.diagnostic.config {
  virtual_text = false,
}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    NvimTreeGitDirty = { fg = "yellow" },
    NvimTreeGitStaged = { fg = "green" },
    NvimTreeGitNew = { fg = "cyan" },
  },
}

M.ui = {
  theme = "catppuccin",
  transparency = true,
  telescope = {
    style = "borderless",
  },
  -- tabufline = {
  --   enabled = false,
  -- },
  statusline = {
    theme = "vscode_colored",
    separator_style = "default",
  },
  cmp = {
    style = "atom_colored",
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "",
    "vscode killers, and jetbrains slayer",
    "",
    "~ Kafkaesque",
    "",
  },

  buttons = {
    { txt = " Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = " Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = " Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = " LazyGit", keys = "gg", cmd = "LazyGit" },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
