return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      -- integrations = {
      --   nvimtree = true,
      -- },
    },
  },
  { "LazyVim/LazyVim", opts = {
    colorscheme = "catppuccin",
  } },
}
