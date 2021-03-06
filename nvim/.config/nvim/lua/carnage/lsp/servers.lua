local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- local function default_on_attach(client, bufnr)
--   -- TODO: Do we need word highlight?
--   -- TODO: Do we need this?
--   -- lsp_keymaps(bufnr)
-- end

local servers = {
  pyright = true,
  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu",
    },
  },
  sumneko_lua = require("carnage.lsp.settings.sumneko_lua"),
  omnisharp = require("carnage.lsp.settings.omnisharp"),
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
    flags = {
      debounce_text_changes = 150,
    },
  }, config)

  lspconfig[server].setup(config)
end

local function setup()
  for server, config in pairs(servers) do
    setup_server(server, config)
  end
end

return {
  setup = setup,
}

