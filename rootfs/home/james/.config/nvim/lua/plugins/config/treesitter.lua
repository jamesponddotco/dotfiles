local installed, treesitter = pcall(require, 'nvim-treesitter.configs')

if not installed then
  return
end

treesitter.setup {
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
  }
}
