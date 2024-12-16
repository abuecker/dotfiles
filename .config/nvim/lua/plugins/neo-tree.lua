return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            hint = "floating-big-letter",
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify", "noice" },
                -- if the buffer type is one of following, the window will be ignored
                buftype = { "terminal", "quickfix" },
              },
            },
          })
        end,
      },
    },
    opts = {
      window = {
        mappings = {
          ["S"] = "split_with_window_picker",
          ["s"] = "vsplit_with_window_picker",
          ["<cr>"] = "open_with_window_picker",
        },
      },
      default_component_configs = {
        symlink_target = {
          enabled = false,
        },
      },
      filesystem = {
        group_empty_dirs = true,
      },
      buffers = {
        group_empty_dirs = true,
      },
    },
  },
}
