local tree_cb = require("nvim-tree.config").nvim_tree_callback
-- Can we just do something like setup.view.mappings.list?
require("nvim-tree").setup{
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      }
    }
  }
}
