scriptencoding utf-8
set encoding=utf-8

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" Converting tabs to spaces
" http://vim.wikia.com/wiki/Converting_tabs_to_spaces
set expandtab       " Insert space characters whenever tab key is pressed
set tabstop=4       " Number of space characters that will
                    " be inserted when the tab key is pressed
set shiftwidth=4    " Number of space characters inserted for indentation
set smarttab

" Considering with https://github.com/airbnb/javascript#whitespace
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

autocmd Filetype html setlocal ts=2 sts=2 sw=2

autocmd BufNewFile,BufRead *.jade set filetype=jade
autocmd Filetype jade setlocal ts=2 sts=2 sw=2

autocmd BufNewFile,BufRead *.less set filetype=less
autocmd Filetype less setlocal ts=2 sts=2 sw=2

syntax enable

" Default text encoding
set termencoding=utf-8
" Highlight column number
set colorcolumn=81

set et
set ai " Auto-identing"
set wrap " Wrap lines visualy"
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

" Hardcore mode"
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Recognize .md as markdown"
au BufRead,BufNewFile *.md set filetype=markdown

" Support vim commands for russian symbols
set keymap=russian-jcukenwin
set iminsert=0

function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

set tags=./tags;/

" --------- Bundles ---------

filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

set background=dark
se t_Co=16
let g:solarized_termcolors=256
colorscheme solarized

Bundle 'kien/ctrlp.vim'
" let g:ctrlp_clear_cache_on_exit = 0

" Comment lines fast!
Bundle 'tpope/vim-commentary'

" Autoclose quotes, brackets, etc
Bundle 'Raimondi/delimitMate'

" Git wrapper
Bundle 'tpope/vim-fugitive'

filetype plugin indent on

" Project manager"
Bundle 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

Bundle 'plasticboy/vim-markdown'

Bundle 'scrooloose/syntastic.git'

Bundle 'tpope/vim-surround'

Bundle 'digitaltoad/vim-jade'

Bundle 'groenewege/vim-less'

Bundle 'majutsushi/tagbar'
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent> <C-F9> :TagbarOpen j<CR>

Bundle 'shawncplus/phpcomplete.vim'

