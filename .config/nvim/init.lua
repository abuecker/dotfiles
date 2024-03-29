-- disable netrw for `nvim-tree`
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- global options
vim.o.swapfile = false -- no backup file created
vim.o.background = "dark" -- use a dark theme

-- window options
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- show line numbers
vim.opt.wrap = false -- don't wrap lines
vim.opt.tabstop = 2 -- default tabwidth
vim.opt.softtabstop = 2 -- default tab width in insert mode
vim.opt.shiftwidth = 2 -- default indent
vim.opt.expandtab = true -- expand tabs to spaces
vim.opt.clipboard = "unnamed" -- share clipboard with system clipboard
vim.opt.foldmethod = "syntax" -- fold based on syntax
vim.opt.foldcolumn = "1" -- defines 1 col at window left, to indicate folding
vim.opt.foldlevelstart = 99 -- start file with all folds opened
vim.opt.signcolumn = "yes" -- always show the signcolumn, otherwise it would shift the text each time

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			integrations = {
				nvimtree = true,
			},
		},
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- {
	-- 	"nordtheme/vim",
	-- 	name = "nord",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- load the colorscheme here
	-- 		vim.cmd("colorscheme nord")
	-- 	end,
	-- },
	--
	-- {
	-- 	"dracula/vim",
	-- 	name = "dracula",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- load the colorscheme here
	-- 		vim.cmd("colorscheme dracula")
	-- 	end,
	-- },

	-- Rose Pine theme
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- load the colorscheme here
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },

	-- configure the LSP
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		priority = 78,
		dependencies = {
			-- For developing Neovim lua
			{ "folke/neodev.nvim", opts = {} },

			-- auto install LSP servers
			{ "williamboman/mason.nvim", lazy = false, priority = 80 },
			{ "williamboman/mason-lspconfig.nvim", lazy = false, priority = 79 },
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({ automatic_installation = true })

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig["lua_ls"].setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- diagnostics = {
						-- 	globals = { "vim" },
						-- },
					},
					capabilities = capabilities,
				},
			})

			lspconfig["pyright"].setup({
				capabilities = capabilities,
			})

			lspconfig["tsserver"].setup({
				capabilities = capabilities,
			})

			lspconfig["rust_analyzer"].setup({
				capabilities = capabilities,
			})

			lspconfig["ansiblels"].setup({
				capabilities = capabilities,
			})

			lspconfig["docker_compose_language_service"].setup({
				capabilities = capabilities,
			})

			lspconfig["dockerls"].setup({
				capabilities = capabilities,
			})

			local root_dir =
				require("lspconfig/util").root_pattern(".yarnrc.yml", "package.json", "tsconfig.json", ".git")
			lspconfig["eslint"].setup({
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
				packageManager = "yarn",
				useESLintClass = true,
				root_dir = root_dir,
			})

			lspconfig["yamlls"].setup({
				capabilities = capabilities,
			})

			lspconfig["jsonls"].setup({
				capabilities = capabilities,
			})

			lspconfig["terraformls"].setup({
				capabilities = capabilities,
			})

			lspconfig["marksman"].setup({
				capabilities = capabilities,
			})

			lspconfig["cssls"].setup({
				capabilities = capabilities,
			})
		end,
	},

	-- autocomplete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			-- snippet engine
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				}, {
					{ name = "buffer" },
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},

	-- enhanced language parser
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			-- Config
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"javascript",
					"html",
					"typescript",
					"python",
					"yaml",
					"rust",
					"terraform",
					"git_config",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"markdown",
				},
				ignore_install = {},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						scope_incremental = "<CR>",
						node_incremental = "<TAB>",
						node_decremental = "<S-TAB>",
					},
				},
			})

			-- Folding
			vim.cmd("set foldmethod=expr")
			vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
			vim.cmd("set nofoldenable") -- Disable folding at startup.
		end,
	},

	-- move out of vim with tmux navigation keys
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
		config = function()
			-- solves slow switching between tmux panes
			vim.opt.shell = "/bin/bash"
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"ckipp01/stylua-nvim",
		build = "cargo install stylua",
		opts = {},
		-- config = function()
		-- 	-- setup 'format on save'
		-- 	-- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
		-- end,
	},

	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
		lazy = false,
	},
	"tpope/vim-surround",
	-- vim session restoration
	{
		"dhruvasagar/vim-prosession",
		lazy = false,
		dependencies = { "tpope/vim-obsession" },
	},
	{
		"nvim-telescope/telescope.nvim", -- fuzzy finder
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim", -- native `fzf`
			"BurntSushi/ripgrep",
			"nvim-telescope/telescope-media-files.nvim",
		},
		config = function()
			require("telescope").setup({
				pickers = {},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, {})
			vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})
			vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions, {})
			vim.keymap.set("n", "<leader>ts", builtin.treesitter, {})
			vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, {})
			vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {})
			vim.keymap.set("n", "<leader>rf", builtin.lsp_references, {})
			vim.keymap.set("n", "<leader>in", builtin.lsp_incoming_calls, {})
			vim.keymap.set("n", "<leader>ou", builtin.lsp_outgoing_calls, {})
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
		end,
	},

	{ "nvim-tree/nvim-web-devicons" },

	-- tree view
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true

			-- empty setup using defaults
			require("nvim-tree").setup({
				filters = {
					dotfiles = false,
				},
				view = {
					width = 40,
					signcolumn = "yes",
				},
				renderer = {
					add_trailing = true,
					group_empty = true,
					root_folder_label = ":t",
					highlight_git = true,
					highlight_opened_files = "name",
					highlight_modified = "icon",
					highlight_clipboard = "name",
					indent_markers = {
						enable = true,
						inline_arrows = true,
					},
					highlight_diagnostics = true,
					icons = {
						git_placement = "signcolumn",
					},
				},
				update_focused_file = {
					enable = true,
				},
				diagnostics = {
					enable = true,
				},
				modified = {
					enable = true,
				},
			})

			vim.keymap.set("n", "<leader>e", function()
				require("nvim-tree.api").tree.toggle({
					path = "<args>",
					find_file = true,
					update_root = false,
					focus = true,
				})
			end, {})

			-- vim.cmd.colorscheme("catppuccin")
		end,
	},

	{ "github/copilot.vim" },

	{
		"earthly/earthly.vim",
		branch = "main",
		config = function()
			vim.cmd([[autocmd FileType Earthfile setlocal commentstring=#\ %s]])
		end,
	},

	-- {
	-- 	"feline-nvim/feline.nvim",
	-- 	opts = {},
	-- },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"catppuccin/nvim",
		},
		opts = {
			options = {
				-- ignore_focus = true,
				theme = "catppuccin",
			},
		},
	},
	{ "powerman/vim-plugin-AnsiEsc" },

	-- git integration
	{ "tpope/vim-fugitive" },

	{ "styled-components/vim-styled-components", branch = "main" },

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			numhl = true,
		},
	},
	{
		"folke/trouble.nvim",
		opts = {
			auto_open = false,
			auto_close = false,
			use_diagnostic_signs = true,
		},
		config = function()
			vim.keymap.set("n", "<leader>xx", function()
				require("trouble").toggle()
			end)
			vim.keymap.set("n", "<leader>xw", function()
				require("trouble").toggle("workspace_diagnostics")
			end)
			vim.keymap.set("n", "<leader>xd", function()
				require("trouble").toggle("document_diagnostics")
			end)
			vim.keymap.set("n", "<leader>xq", function()
				require("trouble").toggle("quickfix")
			end)
			vim.keymap.set("n", "<leader>xl", function()
				require("trouble").toggle("loclist")
			end)
			vim.keymap.set("n", "gR", function()
				require("trouble").toggle("lsp_references")
			end)
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"filipdutescu/renamer.nvim",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("renamer").setup()
			vim.keymap.set("i", "<F2>", function()
				require("renamer").rename()
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>rn", function()
				require("renamer").rename()
			end, { noremap = true, silent = true })
			vim.keymap.set("v", "<leader>rn", function()
				require("renamer").rename()
			end, { noremap = true, silent = true })
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				-- Enable or disable logging
				logging = true,
				-- Set the log level
				log_level = vim.log.levels.WARN,
				-- All formatter configurations are opt-in
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					javascript = {
						require("formatter.filetypes.javascript").prettier,
					},
					javascriptreact = {
						require("formatter.filetypes.javascriptreact").prettier,
					},
					json = {
						require("formatter.filetypes.json").prettier,
					},
					typescript = {
						require("formatter.filetypes.typescript").prettier,
					},
					typescriptreact = {
						require("formatter.filetypes.typescriptreact").prettier,
					},
					markdown = {
						require("formatter.filetypes.markdown").prettier,
					},
					yaml = {
						require("formatter.filetypes.yaml").prettier,
					},
					python = {
						require("formatter.filetypes.python").black,
					},
					ruby = {
						require("formatter.filetypes.ruby").rubocop,
					},
					rust = {
						require("formatter.filetypes.rust").rustfmt,
					},
					terraform = {
						require("formatter.filetypes.terraform").terraformfmt,
					},
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})

			-- Format on save
			vim.cmd([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost * FormatWrite
        augroup END
      ]])
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
})

--------------------------------------------------
-- jump to last cursor position when opening a file
-- dont do it when writing a commit log entry
--------------------------------------------------
vim.cmd([[
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction
]])

--  ----------------------------------
--  Check for file changes on disk
--  ----------------------------------
--  If you are using a console version of Vim, or dealing
--  with a file that changes externally (e.g. a web server log)
--  then Vim does not always check to see if the file has been changed.
--  The GUI version of Vim will check more often (for example on Focus change),
--  and prompt you if you want to reload the file.
--
--  There can be cases where you can be working away, and Vim does not
--  realize the file has changed. This command will force Vim to check
--  more often.
--
--  Calling this command sets up autocommands that check to see if the
--  current buffer has been modified outside of vim (using checktime)
--  and, if it has, reload it for you.
--
--  This check is done whenever any of the following events are triggered:
--  * BufEnter
--  * CursorMoved
--  * CursorMovedI
--  * CursorHold
--  * CursorHoldI
--
--  In other words, this check occurs whenever you enter a buffer, move the cursor,
--  or just wait without doing anything for 'updatetime' milliseconds.
--
--  Normally it will ask you if you want to load the file, even if you haven't made
--  any changes in vim. This can get annoying, however, if you frequently need to reload
--  the file, so if you would rather have it to reload the buffer *without*
--  prompting you, add a bang (!) after the command (WatchForChanges!).
--  This will set the autoread option for that buffer in addition to setting up the
--  autocommands.
--
--  If you want to turn *off* watching for the buffer, just call the command again while
--  in the same buffer. Each time you call the command it will toggle between on and off.
--
--  WatchForChanges sets autocommands that are triggered while in *any* buffer.
--  If you want vim to only check for changes to that buffer while editing the buffer
--  that is being watched, use WatchForChangesWhileInThisBuffer instead.
--
vim.cmd([[
      command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
      command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
      command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
    ]])

-- WatchForChanges function
--
-- This is used by the WatchForChanges* commands, but it can also be
-- useful to call this from scripts. For example, if your script executes a
-- long-running process, you can have your script run that long-running process
-- in the background so that you can continue editing other files, redirects its
-- output to a file, and open the file in another buffer that keeps reloading itself
-- as more output from the long-running command becomes available.
--
-- Arguments:
-- * bufname: The name of the buffer/file to watch for changes.
--     Use '*' to watch all files.
-- * options (optional): A Dict object with any of the following keys:
--   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
--     addition to setting up the autocommands.
--   * toggle: If set to 1, causes this behavior to toggle between on and off.
--     Mostly useful for mappings and commands. In scripts, you probably want to
--     explicitly enable or disable it.
--   * disable: If set to 1, turns off this behavior (removes the autocommand group).
--   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
--     buffer you are editing. (Only the specified buffer will be checked for changes,
--     though, still.) If set to 1, the events will only be triggered while
--     editing the specified buffer.
--   * more_events: If set to 1 (the default), creates autocommands for the events
--     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
--     (Presumably, having too much going on for those events could slow things down,
--     since they are triggered so frequently...)
vim.cmd([[
  function! WatchForChanges(bufname, ...)
    " Figure out which options are in effect
    if a:bufname == '*'
      let id = 'WatchForChanges'.'AnyBuffer'
      " If you try to do checktime *, you'll get E93: More than one match for * is given
      let bufspec = ''
    else
      if bufnr(a:bufname) == -1
        echoerr "Buffer " . a:bufname . " doesn't exist"
        return
      end
      let id = 'WatchForChanges'.bufnr(a:bufname)
      let bufspec = a:bufname
    end
    if len(a:000) == 0
      let options = {}
    else
      if type(a:1) == type({})
        let options = a:1
      else
        echoerr "Argument must be a Dict"
      end
    end
    let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
    let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
    let disable     = has_key(options, 'disable')     ? options['disable']     : 0
    let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
    let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
    if while_in_this_buffer_only
      let event_bufspec = a:bufname
    else
      let event_bufspec = '*'
    end
    let reg_saved = @"
    "let autoread_saved = &autoread
    let msg = "\n"
    " Check to see if the autocommand already exists
    redir @"
      silent! exec 'au '.id
    redir END
    let l:defined = (@" !~ 'E216: No such group or event:')
    " If not yet defined...
    if !l:defined
      if l:autoread
        let msg = msg . 'Autoread enabled - '
        if a:bufname == '*'
          set autoread
        else
          setlocal autoread
        end
      end
      silent! exec 'augroup '.id
        if a:bufname != '*'
          "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
          "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
          exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
        end
          exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
          exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
          exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
        " The following events might slow things down so we provide a way to disable them...
        " vim docs warn:
        "   Careful: Don't do anything that the user does
        "   not expect or that is slow.
        if more_events
          exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
          exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
        end
      augroup END
      let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
    end
    " If they want to disable it, or it is defined and they want to toggle it,
    if l:disable || (l:toggle && l:defined)
      if l:autoread
        let msg = msg . 'Autoread disabled - '
        if a:bufname == '*'
          set noautoread
        else
          setlocal noautoread
        end
      end
      " Using an autogroup allows us to remove it easily with the following
      " command. If we do not use an autogroup, we cannot remove this
      " single :checktime command
      " augroup! checkforupdates
      silent! exec 'au! '.id
      silent! exec 'augroup! '.id
      let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
    elseif l:defined
      let msg = msg . 'Already watching ' . bufspec . ' for external updates'
    end
    echo msg
    let @"=reg_saved
  endfunction

  " Options
  let autoreadargs={'autoread':1}
  " Startup autoread silently
  silent! execute WatchForChanges("*",autoreadargs)
]])

-- -----------------------------
--  Diff the current buffer with saved on disc
-- -----------------------------
vim.cmd([[
  function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
  endfunction
  com! DiffSaved call s:DiffWithSaved()
]])

vim.keymap.set("v", "<leader>s", '"hy:%s/<C-r>h/<C-r>h/g<left><left>', {})
