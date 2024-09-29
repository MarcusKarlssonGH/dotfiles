local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
		vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Telescope lsp_code_actions<CR>", opts)
		vim.keymap.set("n", "<leader>dp", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
		vim.keymap.set("n", "<leader>dn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)
		vim.keymap.set("n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
		vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.keymap.set("n", "<leader>lD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	end,
})

local servers = {
	matlab_ls = true,
	pyright = true,
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--suggest-missing-includes",
			"--clang-tidy",
			"--header-insertion=iwyu",
		},
		filetypes = { "c", "cpp" },
	},
	lua_ls = require("carnage.lsp.settings.sumneko_lua"),
	omnisharp = require("carnage.lsp.settings.omnisharp"),
    cmake = true,
}

local setup_server = function(server, config)
	if not config then
		return
	end

	if type(config) ~= "table" then
		config = {}
	end

	config = vim.tbl_deep_extend("force", {
		-- on_init = custom_init,
		-- on_attach = default_on_attach,
		-- capabilities = updated_capabilities,
	}, config)

	lspconfig[server].setup(config)
end

local function setup_servers()
	for server, config in pairs(servers) do
		setup_server(server, config)
	end
end

setup_servers()
