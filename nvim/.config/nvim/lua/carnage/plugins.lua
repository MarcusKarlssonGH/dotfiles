return require("lazy").setup({
	-- File Explorer
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	-- LSP
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"pyright",
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
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				debounce = 150,
				save_after_format = false,
				sources = {
					nls.builtins.formatting.stylua,
					nls.builtins.diagnostics.shellcheck,
					nls.builtins.diagnostics.markdownlint,
					nls.builtins.formatting.prettierd.with({
						filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
					}),
					-- nls.builtins.code_actions.gitsigns,
					nls.builtins.formatting.isort,
					nls.builtins.formatting.black,
					-- nls.builtins.diagnostics.flake8,
				},
			}
		end,
	},

	-- TreeSitter
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
	-- Fancy things
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
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
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},
	"machakann/vim-sandwich",
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
})
