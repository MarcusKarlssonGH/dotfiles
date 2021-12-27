local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- For more info, see https://github.com/williamboman/nvim-lsp-installer/
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("carnage.lsp.handlers").on_attach,
		capabilities = require("carnage.lsp.handlers").capabilities,
	}
  -- If a server needs a specific setup
  if server.name == "sumneko_lua" then
  	local sumneko_opts = require("carnage.lsp.settings.sumneko_lua")
  	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end
	server:setup(opts)
end)

