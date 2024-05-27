local installed, codeium = pcall(require, 'codeium')

if not installed then
  return
end

vim.g.codeium_filetypes_disabled_by_default = true

vim.g.codeium_filetypes = {
  css = true,
  go = true,
  html = true,
  lua = true,
  make = true,
  markdown = true,
  php = true,
  python = true,
  rust = true,
  sh = true,
  sql = true,
}
