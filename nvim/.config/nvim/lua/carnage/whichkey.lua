local wk = require("which-key")
local my_setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ...
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
		spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
	},
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
}
wk.setup(my_setup)

wk.add({
	{ "<leader>Q", "<cmd>q!<CR>", desc = "Quit", nowait = true, remap = false },
	{ "<leader>b", group = "Buffers", nowait = true, remap = false },
	{ "<leader>bC", "<cmd>bd!<cr>", desc = "Close current", nowait = true, remap = false },
	{ "<leader>bc", "<cmd>bd<cr>", desc = "Close current", nowait = true, remap = false },
	{ "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find Buffer", nowait = true, remap = false },
	{ "<leader>bo", "<cmd>%bd|e#|bd#<cr>", desc = "Close other buffers", nowait = true, remap = false },
	{ "<leader>f", group = "Find", nowait = true, remap = false },
	{ "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
	{
		"<leader>fD",
		"<cmd>Telescope live_grep cwd=~/dotfiles<cr>",
		desc = "grep dotfiles",
		nowait = true,
		remap = false,
	},
	{ "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
	{ "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer", nowait = true, remap = false },
	{
		"<leader>fc",
		"<cmd>Telescope colorscheme enable_preview=true <cr>",
		desc = "Colorscheme with Preview",
		nowait = true,
		remap = false,
	},
	{
		"<leader>fd",
		"<cmd>Telescope find_files cwd=~/dotfiles hidden=true<cr>",
		desc = "Seach dotfiles",
		nowait = true,
		remap = false,
	},
	{ "<leader>fe", "<cmd>Telescope diagnostics<cr>", desc = "Find Errors", nowait = true, remap = false },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", nowait = true, remap = false },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "grep", nowait = true, remap = false },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", nowait = true, remap = false },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
	{ "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Find String", nowait = true, remap = false },
	{ "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX<cr>", desc = "Find TODOs", nowait = true, remap = false },
	{ "<leader>g", group = "git", nowait = true, remap = false },
	{ "<leader>gB", ":Gitsigns blame_line{full=true}<cr>", desc = "full blame", nowait = true, remap = false },
	{ "<leader>gD", ":Gitsigns diffthis('~')<cr>", desc = "diff2", nowait = true, remap = false },
	{ "<leader>gR", ":Gitsigns reset_buffer<cr>", desc = "reset buffer", nowait = true, remap = false },
	{ "<leader>gS", ":Gitsigns stage_buffer<cr>", desc = "stage buffer", nowait = true, remap = false },
	{ "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", desc = "blame", nowait = true, remap = false },
	{ "<leader>gd", ":Gitsigns diffthis<cr>", desc = "diff", nowait = true, remap = false },
	{ "<leader>gp", ":Gitsigns preview_hunk<cr>", desc = "preview", nowait = true, remap = false },
	{ "<leader>gr", ":Gitsigns reset_hunk<cr>", desc = "reset hunk", nowait = true, remap = false },
	{ "<leader>gs", ":Gitsigns stage_hunk<cr>", desc = "stage hunk", nowait = true, remap = false },
	{ "<leader>gt", ":Gitsigns toggle_deleted<cr>", desc = "toggle deleted", nowait = true, remap = false },
	{ "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", desc = "undo stage", nowait = true, remap = false },
	{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
	{ "<leader>l", group = "lsp", nowait = true, remap = false },
	{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code actions", nowait = true, remap = false },
	{ "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Fromat buffer", nowait = true, remap = false },
	{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename symbol", nowait = true, remap = false },
	{ "<leader>n", group = "neorg", nowait = true, remap = false },
	{ "<leader>ne", ":Neorg toc<cr>", desc = "(explore) table of content", nowait = true, remap = false },
	{ "<leader>ni", ":Neorg index<cr>", desc = "index", nowait = true, remap = false },
	{ "<leader>nr", ":Neorg return<cr>", desc = "return", nowait = true, remap = false },
	{ "<leader>nt", ":Neorg toggle-concealer<cr>", desc = "toggle concealer", nowait = true, remap = false },
	{ "<leader>p", group = "python", nowait = true, remap = false },
	{
		"<leader>pr",
		"<cmd>terminal python3 %<cr>",
		desc = "Run current file in terminal",
		nowait = true,
		remap = false,
	},
	{
		"<leader>pp",
		"<cmd>terminal pypy3 %<cr>",
		desc = "Run current file in terminal",
		nowait = true,
		remap = false,
	},
	{
		"<leader>pt",
		"<cmd>terminal python3 % test.in<cr>",
		desc = "Run current file in terminal",
		nowait = true,
		remap = false,
	},
	{ "<leader>r", group = "refactor", nowait = true, remap = false },
	{
		"<leader>re",
		"<Esc><cmd>lua require('refactoring').refactor('Extract Block')<cr>",
		desc = "Extract Block",
		nowait = true,
		remap = false,
	},
	{
		"<leader>rf",
		"<Esc><cmd>lua require('refactoring').refactor('Extract Block To File')<cr>",
		desc = "Extract Block To File",
		nowait = true,
		remap = false,
	},
	{ "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
	{
		{
			mode = { "v" },
			{ "<leader>g", group = "git", nowait = true, remap = false },
			{
				"<leader>gr",
				":Gitsigns gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')}<cr>",
				desc = "reset",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gs",
				":Gitsigns gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')}<cr>",
				desc = "stage",
				nowait = true,
				remap = false,
			},
			{ "<leader>r", group = "refactor", nowait = true, remap = false },
			{
				"<leader>re",
				" <Esc><cmd>lua require('refactoring').refactor('Extract Function')<cr>",
				desc = "Extract Function",
				nowait = true,
				remap = false,
			},
			{
				"<leader>rf",
				" <Esc><cmd>lua require('refactoring').refactor('Extract Function To File')<cr>",
				desc = "Extract Function To File",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ri",
				" <Esc><cmd>lua require('refactoring').refactor('Inline Variable')<cr>",
				desc = "Inline Variable",
				nowait = true,
				remap = false,
			},
			{
				"<leader>rv",
				" <Esc><cmd>lua require('refactoring').refactor('Extract Variable')<cr>",
				desc = "Extract Variable",
				nowait = true,
				remap = false,
			},
		},
	},
})
