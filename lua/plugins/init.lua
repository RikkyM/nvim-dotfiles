return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    lazy = false,
    opts = require "configs.conform",
  },

  {
    "folke/which-key.nvim",
    lazy = false,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "folke/trouble.nvim",
    opts = {},
    lazy = false,
    cmd = "Trouble",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.chunk"
      -- require("hlchunk").setup({})
    end,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
      vim.diagnostic.config { virtual_text = false }
      require "configs.inline-diagnostics"
    end,
  },

  -- {
  --   "pocco81/auto-save.nvim",
  --   event = { "InsertLeave", "TextChanged" },
  --   config = function()
  --     require "configs.auto-save"
  --   end,
  -- },

  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true },

  {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = "FloatermToggle",
  },

  {
    "gisketch/triforce.nvim",
    dependencies = { "nvzone/volt" },
    keys = {
      {
        "<leader>tp",
        function()
          require "configs.triforce"
        end,
      },
    },
    opts = {},
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "right",
      },
      git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        timeout = 2000,
      },
      renderer = {
        icons = {
          show = {
            git = true,
          },
          glyphs = {
            git = {
              unstaged = "●", -- ganti dari ✗ jadi bulat kecil
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "◌", -- ganti dari ✗ jadi lingkaran putus-putus
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    },
  },

  {
    "kevinhwang91/promise-async",
  },

  -- Konfigurasi nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost", -- Muat plugin setelah membaca buffer
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" } -- Menggunakan LSP atau indentasi sebagai penyedia lipatan
      end,
    },
    init = function()
      -- Pengaturan Neovim yang dibutuhkan nvim-ufo
      vim.o.foldcolumn = "1" -- Menampilkan kolom lipatan di sebelah kiri
      vim.o.foldlevel = 99 -- Membuka semua lipatan secara default
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function(_, opts)
      -- require("ufo").setup(opts)
      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { "lsp", "indent" }
        end,
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    enabled = false,
  },

  {
    "folke/trouble.nvim",
    opts = {},
    lazy = false,
    cmd = "Trouble",
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },

  {
    "slowy07/mywpm.nvim",
    dependencies = "nvzone/volt",
    event = "VeryLazy",
    config = function()
      require "configs.mywpm"
    end,
  },

  { "nvchad/showkeys", cmd = "ShowkeysToggle", opts = { position = "top-center" } },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "xml",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
    },
    config = function()
      require "configs.autotag"
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
