" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

syntax enable

" Converting tabs to spaces
" http://vim.wikia.com/wiki/Converting_tabs_to_spaces
set expandtab       " Insert space characters whenever tab key is pressed
set tabstop=4       " Number of space characters that will
                    " be inserted when the tab key is pressed
set shiftwidth=4    " Number of space characters inserted for indentation
set smarttab

" Default text encoding
set termencoding=utf-8
" Highlight column number
set colorcolumn=81

set et
set nowrap
set ai
set cin

set showmatch
set hlsearch
set incsearch
set ignorecase

set number " always show line numbers

" Don't make backups and swapfiles
set nobackup
set noswapfile

" Highlight trailing whitespaces
" http://vim.wikia.com/wiki/VimTip396#Using_the_list_and_listchars_options
set list
set listchars=tab:▷⋅,trail:⋅,extends:#,nbsp:⋅

" Automatically remove all trailing whitespaces
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * :%s/\s\+$//e

set pastetoggle=<F2>

" Navigation between windows
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-h> <C-w><C-h>
noremap <C-l> <C-w><C-l>

" Swap top/bottom or left/right split
noremap <C-r> <C-w><C-r>

" Close every window in the current tabview but the current one
noremap <C-o> <C-w><C-o>

" Close current window
noremap <C-c> <C-w><C-c>

" --------- Bundles ---------

filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

set background=light
se t_Co=16
let g:solarized_termcolors=256
colorscheme solarized

Bundle 'kien/ctrlp.vim'
let g:ctrlp_clear_cache_on_exit = 0

" Comment lines fast!
Bundle 'tpope/vim-commentary'

" Autoclose quotes, brackets, etc
Bundle 'Raimondi/delimitMate'

" Git wrapper
Bundle 'tpope/vim-fugitive'

filetype plugin indent on

