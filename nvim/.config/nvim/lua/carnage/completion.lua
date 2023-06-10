local lspkind = require("lspkind")
lspkind.init()

local cmp = require'cmp'
cmp.setup({
  mapping = {
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-l>'] = cmp.mapping.confirm({ select = true }),
    ['<C-f>'] = cmp.mapping.confirm({ select = true }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-s>'] = cmp.mapping.scroll_docs(4),
  },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      },
    },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
