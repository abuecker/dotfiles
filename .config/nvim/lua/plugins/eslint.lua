local root_dir = require("lspconfig/util").root_pattern(".yarnrc.yml", "package.json", "tsconfig.json", ".git")

return {
  {
    "neovim/nvim-lspconfig",
    -- other settings removed for brevity
    opts = {
      ---@type lspconfig.options
      setup = {
        eslint = {
          packageManager = "yarn",
          -- useESLintClass = true,
          root_dir = root_dir,
        },
      },
    },
  },
}
