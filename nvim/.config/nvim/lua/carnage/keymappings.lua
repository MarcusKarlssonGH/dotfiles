vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })

-- Reload (Temp for development)
vim.api.nvim_set_keymap("n", "<leader>r", ":luafile %<CR>", { noremap = true })

-- Better Window Movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- Navigate buffers
vim.api.nvim_set_keymap("n", "<M-l>", ":BufferLineCycleNext<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-h>", ":BufferLineCyclePrev<CR>", { silent = true })

-- Better indenting
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })

-- Don't use escape
vim.api.nvim_set_keymap("i", "<C-c>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<ESC>", { noremap = true, silent = true })

-- Move selected lines in visual mode
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":move .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-j>", ":move .+1<CR>==", { noremap = true, silent = true })

-- Why do we have to map to _ when we use /?
vim.api.nvim_set_keymap("v", "<C-_>", "gc", { silent = true })
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { silent = true })

-- Pro tips from Primeagen
-- Make yank behave
vim.api.nvim_set_keymap("n", "Y", "yg$", { noremap = true, silent = true })
-- Better jumping
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
-- Undo checkpoints
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", { noremap = true, silent = true })

-- Jess Archer
vim.keymap.set("", "gf", ":edit <cfile><cr>") -- Edit file under cursor
vim.keymap.set("n", "<leader>x", ":!xdg-open %<cr><cr>") -- Open current file in default program

vim.keymap.set("v", "<leader>lf", vim.lsp.buf.format, { remap = false })

-- Quickfix
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<CR>zz")

-- Diagnostic
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
