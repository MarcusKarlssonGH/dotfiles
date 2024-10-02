local severity = vim.diagnostic.severity

vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[severity.ERROR] = "",
			[severity.WARN] = "",
			[severity.INFO] = "",
			[severity.HINT] = "",
		},
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})
