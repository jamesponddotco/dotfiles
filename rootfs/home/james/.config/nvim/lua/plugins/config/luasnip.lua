local installed, _ = pcall(require, 'luasnip')

if not installed then
  return
end

require("luasnip/loaders/from_vscode").lazy_load({
  paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' },
})
