require("telescope").setup{
  pickers = {
    -- see /home/marcus/rndm/LunarVim/lua/lvim/core/telescope/
    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end,
      only_sort_text = true,
      theme = "dropdown",
      hidden = true,
    },

  },
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = require('telescope.actions').close
      }
    }
  }
}

require("telescope").load_extension("fzf")

