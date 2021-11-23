require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = require('telescope.actions').close
      }
    }
  }
}
require("telescope").load_extension("fzf")

vim.api.nvim_set_keymap('n', '<leader>fd', ":Telescope find_files cwd=~/dotfiles hidden=true<CR>", { noremap = true, silent = true })
