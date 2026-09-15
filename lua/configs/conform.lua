local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier", "eslint_d" },
    typescript = { "prettier", "eslint_d" },
    javascriptreact = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 600,
    lsp_fallback = true,
  },
}

return options
