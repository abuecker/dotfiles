return {
  {
    "earthly/earthly.vim",
    branch = "main",
    config = function()
      vim.cmd([[autocmd FileType Earthfile setlocal commentstring=#\ %s]])
    end,
  },
}
