require("telescope").setup({
	pickers = {
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end,
			only_sort_text = true,
			theme = "dropdown",
			hidden = true,
		},
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
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })
