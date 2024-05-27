-- Disable vimscript plugins that are bundled with Neovim by default.
local plugins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'tutor',
  'rplugin',
  'syntax',
  'synmenu',
  'optwin',
  'compiler',
  'bugreport',
  'ftplugin',
}

for _, plugin in pairs(plugins) do
  vim.g['loaded_' .. plugin] = 1
end

-- Safely require impatient plugin.
pcall (require, 'impatient')

-- Require core Neovim options.
require ('core')

-- Require plugin options.
require ('plugins')
