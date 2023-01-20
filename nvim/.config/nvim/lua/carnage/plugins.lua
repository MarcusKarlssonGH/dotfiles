return require('lazy').setup({
-- File Explorer
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
  },
-- LSP
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
-- Completion
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
  -- 'hrsh7th/cmp-buffer', -- From open buffers,
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lua',
  'onsails/lspkind-nvim',
  'folke/neodev.nvim',
-- Formatting
  'jose-elias-alvarez/null-ls.nvim',

-- TreeSitter
  {'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
-- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
-- Fancy things
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons', opt = true}
  },
  'christianchiarulli/nvcode-color-schemes.vim',
  {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons'
  },
  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  },
  {
    "folke/which-key.nvim",
    config = function() require("which-key").setup { } end
  },
  "machakann/vim-sandwich",
  "folke/tokyonight.nvim",
  {
  "ggandor/leap.nvim",
    config = function() require("leap").add_default_mappings() end
  },
})
