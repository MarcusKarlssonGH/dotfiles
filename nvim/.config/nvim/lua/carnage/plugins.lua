return require("lazy").setup({
	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	-- LSP
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				-- language servers
				"clangd",
				"pyright",
				-- Linters/formatters
				"alex",
				"black",
				"clang-format",
				"isort",
				"latexindent",
				"proselint",
				"shellcheck",
				"stylua",
				"write-good",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	-- 'hrsh7th/cmp-buffer', -- From open buffers,
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	"onsails/lspkind-nvim",
	{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					tex = { "latexindent" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
					async = false,
					-- lsp_format = "fallback",
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},
	-- { -- Linting
	-- 	"mfussenegger/nvim-lint",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		local lint = require("lint")
	-- 		lint.linters_by_ft = {
	-- 			tex = { "alex", "write-good", "proselint" },
	-- 			python = { "pylint" },
	-- 		}
	-- 		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
	-- 		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	-- 			group = lint_augroup,
	-- 			callback = function()
	-- 				require("lint").try_lint()
	-- 			end,
	-- 		})
	-- 		vim.keymap.set("n", "<leader>l", function()
	-- 			lint.try_lint()
	-- 		end, { desc = "Trigger linting for current file" })
	-- 	end,
	-- },

	-- -- TreeSitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	-- Fancy things
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		opts = {
			theme = "tokyonight",
		},
	},
	"christianchiarulli/nvcode-color-schemes.vim",
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = true,
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},
	-- "machakann/vim-sandwich",
	"folke/tokyonight.nvim",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
	},
	-- {
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- },
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	build = ":Neorg sync-parsers",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("neorg").setup({
	-- 			load = {
	-- 				["core.defaults"] = {}, -- Loads default behaviour
	-- 				["core.concealer"] = {
	-- 					config = {
	-- 						icon_preset = "diamond",
	-- 					},
	-- 				}, -- Adds pretty icons to your documents
	-- 				["core.dirman"] = { -- Manages Neorg workspaces
	-- 					config = {
	-- 						workspaces = {
	-- 							notes = "~/notes",
	-- 						},
	-- 						default_workspace = "notes",
	-- 					},
	-- 				},
	-- 				["core.summary"] = {},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"hiphish/rainbow-delimiters.nvim",
		config = function()
			require("rainbow-delimiters.setup").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
})
