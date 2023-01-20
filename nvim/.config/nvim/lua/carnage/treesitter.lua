require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "python",
    "lua",
    "bash",
    "cpp",
    "c",
    "vim",
    "help",
  }
}

