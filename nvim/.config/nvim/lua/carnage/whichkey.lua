local wk =require("which-key")
local my_setup = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false, -- adds help for operators like d, y, ...
          motions = false, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
        spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
      },
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
    }
wk.setup(my_setup)
local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
local mappings = {
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  f = {
    name = "Find",
    b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    g = { "<cmd>Telescope live_grep<cr>", "grep" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    s = { "<cmd>Telescope grep_string<cr>", "Find String" },
    d = { "<cmd>Telescope find_files cwd=~/dotfiles hidden=true<cr>", "Seach dotfiles" },
    p = {
      "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump to Bufffer" },
    f = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    c = { "<cmd>bd<cr>", "Close current" },
    o = { '<cmd>%bd|e#|bd#<cr>', "Close other buffers" },
  },
  l = {
    name = "lsp",
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Fromat buffer" },
  },
}

wk.register(mappings, opts)
