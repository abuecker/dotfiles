local root_dir = require("lspconfig/util").root_pattern(".yarnrc.yml", "package.json", "tsconfig.json", ".git")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type lspconfig.options
      eslint = {
        packageManager = "yarn",
        -- useESLintClass = true,
        root_dir = root_dir,
      },
    },
  },
}
