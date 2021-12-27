require("carnage.settings")
require("carnage.keymappings")
require("carnage.plugins")
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

-- Why does the setup work here, but not in plugins.lua?
require("Comment").setup()
