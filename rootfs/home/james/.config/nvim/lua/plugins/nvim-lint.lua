return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    local stylelint = lint.linters.stylelint

    lint.linters_by_ft = {
      css = { 'stylelint' },
      scss = { 'stylelint' },
      javascript = { 'eslint' },
      typescript = { 'eslint' },
      php = {
        'phpcs',
        'phpstan',
      },
      sh = { 'shellcheck' },
    }

    stylelint.args = {
      '-f',
      'json',
      '--quiet-deprecation-warnings',
      '--stdin',
      '--stdin-filename'
    }

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end
}
