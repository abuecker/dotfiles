return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      },
    },
  },
}
