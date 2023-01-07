return {
  capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  end,
  cmd = {
    "/home/marcus/language-servers/omnisharp-linux-x64/run",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid()),
  },
}

