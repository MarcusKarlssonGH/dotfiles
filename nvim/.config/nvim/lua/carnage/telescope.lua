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

