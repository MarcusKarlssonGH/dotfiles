require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {"latex"},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "bash",
    "c_sharp",
    "cpp",
    "json",
    -- "latex",
    "markdown",
    "python",
    "regex",
    "yaml",
  }
}

