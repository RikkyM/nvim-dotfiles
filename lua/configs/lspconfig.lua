require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "emmet_language_server",
  "docker_language_server",
  -- "laravel_lsp",
  -- "laravel-ls",
  "intelephense",
  -- "phpactor",
  "eslint",
  "tailwindcss",
  "jsonls",
}

vim.diagnostic.config {
  virtual_text = false,
}

vim.lsp.config("intelephense", {
  settings = {
    intelephense = {
      diagnostics = {
        undefinedMethods = false,
      },
    },
  },
})

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers
