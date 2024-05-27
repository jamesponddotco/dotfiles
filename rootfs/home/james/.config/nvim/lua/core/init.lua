local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Ensure an in-memory directory exists for the 'undo' feature.
local undo_dir = '/dev/shm/nvim/undo'
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, 'p')
end

opt.shortmess:append 'sI'

opt.encoding = 'utf8'
opt.ffs = 'unix,dos,mac'
opt.spell = true
opt.spelllang = 'en'
opt.ruler = true
opt.autoread = true
opt.backup = false
opt.wb = false
opt.swapfile = false
opt.undodir = undo_dir

opt.clipboard = 'unnamedplus'
opt.cursorline = true
opt.linespace = 5
opt.laststatus = 2
opt.hlsearch = true

opt.pumblend = 17
opt.wildmode = 'longest:full'
opt.wildoptions = 'pum'
opt.completeopt = 'menu,menuone,noselect'

opt.termguicolors = true
opt.background = 'dark'

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 0
opt.shiftwidth = 2
opt.smarttab = true
opt.autoindent = true
opt.linebreak = true
opt.breakindent = true
opt.breakindentopt = 'sbr'
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.copyindent = true
opt.number = true
opt.showmatch = true
opt.magic = true
opt.splitbelow = true
opt.errorbells = false
opt.visualbell = false
opt.foldenable = false
opt.wildmenu = true
opt.hidden = true
opt.mouse = 'a'
opt.tm = 500
opt.colorcolumn = { 72, 80, 120 }
opt.textwidth = 79


