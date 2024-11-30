return {
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-context",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        'bash',
        'css',
        'go',
        'gomod',
        'html',
        'javascript',
        'json',
        'lua',
        'make',
        'markdown',
        'php',
        'phpdoc',
        'rust',
        'toml',
        'vim',
        'yaml'
      },
      auto_install = false,
      highlight = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    })
  end
}
