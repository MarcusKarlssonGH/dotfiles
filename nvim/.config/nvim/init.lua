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



-- old

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

local map = function(lhs, rhs, desc)
  if desc then
    desc = "[DAP] " .. desc
  end

  vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end
map("<F1>", require("dap").step_back, "step_back")
map("<F2>", require("dap").step_into, "step_into")
map("<F3>", require("dap").step_over, "step_over")
map("<F4>", require("dap").step_out, "step_out")
map("<F5>", require("dap").continue, "continue")
-- require("dap").stop:

local dap = require("dap")
dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/home/marcus/.vscode/extensions/ms-vscode.cpptools-1.13.8-linux-x64/debugAdapters/bin/OpenDebugAD7"
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    -- miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

-- Python
dap.adapters.python = {
  type = 'executable';
  command = '/home/marcus/code/rndm/python-playground/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";

    program = "${file}";
    pythonPath = function()
      return "/usr/bin/python3"
      -- local cwd = vim.fn.getcwd()
      -- if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
      --   return cwd .. '/venv/bin/python'
    end
  },
}

local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
