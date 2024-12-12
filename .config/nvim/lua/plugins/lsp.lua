return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        ruff = {},
        ts_ls = {},
        rust_analyzer = {},
        ansiblels = {},
        docker_compose_language_service = {},
        dockerls = {},
        eslint = {},
        yamlls = {},
        jsonls = {},
        terraformls = {},
        marksman = {},
        cssls = {},
      },
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
