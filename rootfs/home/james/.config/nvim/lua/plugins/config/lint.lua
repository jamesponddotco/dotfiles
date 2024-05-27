local installed, lint = pcall(require, 'lint')

if not installed then
  return
end

lint.linters_by_ft = {
  css = { 'stylelint' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  php = {
    'phpcs',
    'phpstan',
  },
  sh = { 'shellcheck' },
}

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
