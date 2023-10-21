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
-- Set Space as leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '
-- Set ; as local leader
vim.g.maplocalleader = ';'

-- Recommended for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("carnage.settings")
require("carnage.plugins")
require("carnage.keymappings")
require("carnage.colorscheme")
require("carnage.completion")
require("carnage.lsp")
require("carnage.nvim-tree")
require("carnage.telescope")
require("carnage.treesitter")
require("carnage.whichkey")

-- Fancy things
require("carnage.lualine")
require("carnage.bufferline")
require("carnage.dap")
