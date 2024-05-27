local installed, cmp = pcall(require, 'cmp')

if not installed then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = {
    { name = 'nvim_lsp', priority = 100 },
    { name = "path" },
    { name = "spell" },
    { name = "treesitter" },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer', priority = 1 },
  },
})
