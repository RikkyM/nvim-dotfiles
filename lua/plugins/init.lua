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

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        -- ambil baris terakhir yang di-fold (closing tag), rapikan spasi di depannya
        local endText = vim.trim(vim.api.nvim_buf_get_lines(0, endLnum - 1, endLnum, false)[1] or "")
        local suffix = ("  ⋯ %s"):format(endText)
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText, hlGroup = chunk[1], chunk[2]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < width then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, width - curWidth)
            table.insert(newVirtText, { chunkText, hlGroup })
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end,
    },
    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function(_, opts)
      require("ufo").setup(opts)
    end,
  },

  -- Konfigurasi nvim-ufo
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = "kevinhwang91/promise-async",
  --   event = "BufReadPost", -- Muat plugin setelah membaca buffer
  --   opts = {
  --     provider_selector = function(bufnr, filetype, buftype)
  --       return { "treesitter", "indent" } -- Menggunakan LSP atau indentasi sebagai penyedia lipatan
  --     end,
  --   },
  --   init = function()
  --     -- Pengaturan Neovim yang dibutuhkan nvim-ufo
  --     vim.o.foldcolumn = "1" -- Menampilkan kolom lipatan di sebelah kiri
  --     vim.o.foldlevel = 99 -- Membuka semua lipatan secara default
  --     vim.o.foldlevelstart = 99
  --     vim.o.foldenable = true
  --   end,
  --   config = function(_, opts)
  --     -- require("ufo").setup(opts)
  --     require("ufo").setup {
  --       provider_selector = function(bufnr, filetype, buftype)
  --         return { "lsp", "indent" }
  --       end,
  --     }
  --   end,
  -- },

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
  },

  { "dmmulroy/ts-error-translator.nvim" },

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
