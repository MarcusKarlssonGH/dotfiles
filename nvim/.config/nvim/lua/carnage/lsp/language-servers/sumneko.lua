local root_path = "/home/marcus/.local/share/nvim/lsp_servers/sumneko_lua/extension/server"
local binary_path = root_path.."/bin/Linux/lua-language-server"
local main_path = root_path.."/main.lua"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.sumneko_lua.setup {
	capabilities = capabilities,
  cmd = {binary_path, "-E", main_path};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
