require("keymappings")
require("colorscheme")
require("settings")
require("plugins")
require('configs')
require("completion")
require("language-servers")
require("configs.lsp")

-- Why does the setup work here, but not in plugins.lua?
require("Comment").setup()
