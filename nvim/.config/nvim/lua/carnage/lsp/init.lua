local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("carnage.lsp.lsp-installer")
require("carnage.lsp.handlers").setup()
require("carnage.lsp.language-servers")
-- require("configs.lsp.null-ls")
