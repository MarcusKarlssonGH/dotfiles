require("telescope").setup({
	pickers = {
		-- see /home/marcus/rndm/LunarVim/lua/lvim/core/telescope/
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end,
			only_sort_text = true,
			theme = "dropdown",
			hidden = true,
		},

		--   local opts = themes.get_dropdown {
		--     winblend = 10,
		--     border = true,
		--     previewer = false,
		--     shorten_path = false,
		--   }
		--   -- require("telescope.builtin").lsp_code_actions(opts)
		-- end
	},
	defaults = {
		mappings = {
			i = {
				["<Esc>"] = require("telescope.actions").close,
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				border = true,
				previewer = false,
				shorten_path = false,
			}),
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
