" Load my extensions using vim-plugin.
call plug#begin('~/.vim/bundle')
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'preservim/nerdtree'
Plug 'chr4/nginx.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sotte/presenting.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tmux-plugins/vim-tmux'
Plug 'cespare/vim-toml'
Plug 'ap/vim-css-color'
Plug 'dense-analysis/ale'
Plug 'rhysd/vim-grammarous'
Plug 'StanAngeloff/php.vim'
Plug 'fatih/vim-go'
call plug#end()

" General settings.
set nocompatible
set history=500
set ruler
set autoread
set encoding=utf8
set ffs=unix,dos,mac
filetype plugin on
filetype indent on

" Backup options.
set nobackup
set nowb
set noswapfile

" Highlight settings.
syntax on
set hlsearch

" Color and font settings.
set termguicolors
set background=dark
colorscheme nord
set cursorline
set linespace=5
set laststatus=2

" Editing settings.
set spelllang=en
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set linebreak
set showbreak=↪
set breakindent
set breakindentopt=sbr
set incsearch
set ignorecase
set smartcase
set nobackup
set copyindent
set number
set showmatch
set magic
set splitbelow
set noerrorbells
set novisualbell
set nofoldenable
set wildmenu
set hidden
set mouse=a
set t_vb=
set tm=500
set colorcolumn=80 textwidth=79
highlight ColorColumn ctermbg=7

" Editing settings per filetype.
autocmd FileType markdown setlocal cc=73 tw=72
autocmd FileType gitcommit setlocal cc=73 tw=72
autocmd FileType mail setlocal cc=73 tw=72 noautoindent

" Settings for the Nord colorscheme.
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

" Settings for ale.
let g:ale_sh_shfmt_options = '-i 2 -ci'
let g:ale_gitcommit_gitlint_options = '-C ~/.config/gitlint/default.ini'

" Settings for vim-grammarous.
let g:grammarous#use_vim_spelllang = 1
let g:grammarous#default_comments_only_filetypes = {
      \ '*' : 1, 'help' : 0, 'markdown' : 0,
      \ }

" Settings for NERDTree.
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Settings for presenting.vim.
let g:presenting_top_margin = 2

" Settings for indentLine.
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1

" Settings for lightline.vim.
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'fugitive', 'filename' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'FugitiveHead',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': {
      \   'left': '',
      \   'right': ''
      \ },
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
    \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" Fix fonts with powerline.
let g:airline_powerline_fonts = 1

" Disable netrw.
let g:netrw_dirhistmax = 0

" Integrate limelight.vim with goyo.vim.
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Enable persistent 'undo' while the computer is on.
if !isdirectory("/dev/shm/.vim/undo")
  call mkdir("/dev/shm/.vim/undo", "p", 0700)
endif
set undodir=/dev/shm/.vim/undo
set undofile

" Makes opening NERDTree easier to remember.
map <C-x> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>

" Open NERDTree by default if no file is specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
