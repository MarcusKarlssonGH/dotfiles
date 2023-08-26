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
local normal_opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
local normal_mappings = {
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  f = {
    name = "Find",
    b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
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
    D = { "<cmd>Telescope live_grep cwd=~/dotfiles<cr>", "grep dotfiles" },
    c = { "<cmd>Telescope colorscheme enable_preview=true <cr>", "Colorscheme with Preview", },
    t = { "<cmd>TodoTelescope keywords=TODO,FIX<cr>", "Find TODOs" },
  },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump to Bufffer" },
    f = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    c = { "<cmd>bd<cr>", "Close current" },
    C = { "<cmd>bd!<cr>", "Close current" },
    o = { '<cmd>%bd|e#|bd#<cr>', "Close other buffers" },
  },
  l = {
    name = "lsp",
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Fromat buffer" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
  },
  d = {
    name = "debug",
    b = { require("dap").toggle_breakpoint, "Toggle breakpoint" },
    B = { function()
      require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ")
    end, "Conditional breakpoint" },
    e = { require("dapui").eval, "Evaluate current" },
    E = { function()
      require("dapui").eval(vim.fn.input "[DAP] Expression: ")
    end, "Evaluate expression" },
    t = { require("dapui").toggle, "toggle dap ui" },
    q = { function()
        require("dapui").close()
        require("dap").close()
    end, "quit debugger"},
  },
  r = {
    name = "refactor",
    e = { " <Esc><cmd>lua require('refactoring').refactor('Extract Block')<cr>", "Extract Block" },
    f = { " <Esc><cmd>lua require('refactoring').refactor('Extract Block To File')<cr>", "Extract Block To File" },
  },
}

wk.register(normal_mappings, normal_opts)

local visual_mappings = {
  r = {
    name = "refactor",
    e = { " <Esc><cmd>lua require('refactoring').refactor('Extract Function')<cr>", "Extract Function" },
    f = { " <Esc><cmd>lua require('refactoring').refactor('Extract Function To File')<cr>", "Extract Function To File" },
    v = { " <Esc><cmd>lua require('refactoring').refactor('Extract Variable')<cr>", "Extract Variable" },
    i = { " <Esc><cmd>lua require('refactoring').refactor('Inline Variable')<cr>", "Inline Variable" },
  },
}
local visual_opts = {
      mode = "v", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
wk.register(visual_mappings, visual_opts)

