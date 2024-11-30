return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

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
  end
}
