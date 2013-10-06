" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

syntax enable

set tabstop=4
set shiftwidth=4
set smarttab
set et      " включим автозамену по умолчанию 
set wrap    " попросим Vim переносить длинные строки
set ai      " включим автоотступы для новых строк
set cin     " включим отступы в стиле Си

" поиск и подсветка результатов поиска и совпадения скобок
set showmatch 
set hlsearch
set incsearch
set ignorecase

set number

filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

set background=dark
se t_Co=16
let g:solarized_termcolors=256 
colorscheme solarized

filetype plugin indent on

