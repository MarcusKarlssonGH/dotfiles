-- Set Space as leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '


vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Reload (Temp for development)
vim.api.nvim_set_keymap('n', '<leader>r', ':luafile %<CR>', { noremap = true })

-- Better Window Movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- Navigate buffers
vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', { silent = true })

-- Better indenting
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })

-- Tab to swich buffer
--vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- Don't use escape
-- vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })


-- Move selected lines in visual mode
vim.api.nvim_set_keymap('x', 'K', ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'J', ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ":move .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', ":move .+1<CR>==", { noremap = true, silent = true })

-- Why do we have to map to _ when we use /?
vim.api.nvim_set_keymap('v', '<C-_>', 'gc', { silent = true })
vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', { silent = true })

-- Pro tips from Primeagen
-- Make yank behave
vim.api.nvim_set_keymap('n', 'Y', 'yg$', { noremap = true, silent = true })
-- Better jumping
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', "mzJ`z", { noremap = true, silent = true })
-- Undo checkpoints
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', { noremap = true, silent = true })
