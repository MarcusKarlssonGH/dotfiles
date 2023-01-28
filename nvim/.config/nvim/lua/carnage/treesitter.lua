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
    "c",
    "cpp",
    "c_sharp",
    "vim",
    "help",
    "json",
    "yaml",
    "latex",
    "markdown",
    "regex",
  }
}

