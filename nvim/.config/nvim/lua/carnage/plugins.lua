return require('packer').startup(function(use)
-- Package Manager
  use 'wbthomason/packer.nvim'
-- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    }
-- LSP
  use 'neovim/nvim-lspconfig'
-- Completion
	use 'hrsh7th/nvim-cmp' -- Completion engine
  use 'hrsh7th/cmp-buffer' -- From open buffers
  use 'hrsh7th/cmp-path' -- File/path completion
  use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp'
  use 'onsails/lspkind-nvim'
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")
        saga.init_lsp_saga({
        })
    end,
  })
  use { 'L3MON4D3/LuaSnip' }
-- Formatting
  use 'jose-elias-alvarez/null-ls.nvim'

-- TreeSitter
  use {'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'}
-- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
-- Fancy things
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }
  use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup { } end
  }
  use "machakann/vim-sandwich"

  -- use "/home/marcus/code/nvim/stackmap.nvim/"
end)
