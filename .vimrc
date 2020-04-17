call plug#begin('~/.vim/plugged')
" ------------ PLUGINS -----------

" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" NerdTree
Plug 'scrooloose/nerdtree'

" Wakatime
Plug 'wakatime/vim-wakatime'

" Emmet
Plug 'mattn/emmet-vim'

" ------------ COLORS ------------
Plug 'relastle/bluewery.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'NerdyPepper/vim-colors-plain'
Plug 'arzg/vim-colors-xcode'
Plug 'morhetz/gruvbox'

" NerdTree config
map <F8> :NERDTreeToggle<CR>

" Emmet conifg
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

call plug#end()
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

"set tabstop=2
"set shiftwidth=2
"set expandtab
"set ai
set number
"set hlsearch
set ruler

filetype plugin indent on

set showmatch
set ts=2
set sw=2
set ai
set smartindent
set smarttab
"set expandtab

set smartindent

" save backups to /tmp 
set noswapfile
set backupdir^=~/tmp,/tmp

" switch between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" tabs binding
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>

let g:go_highlight_trailing_whitespace_error=0
au InsertEnter *.go match goSpaceError /\s\+\%#\@<!$/
au InsertLeave *.go match goSpaceError /\s\+$/

hi Error NONE 
autocmd BufWritePost *.tex !xelatex -output-directory pdfs/ % <afile>

" vue
autocmd Filetype vue setlocal ts=2 sw=2 expandtab

syntax on
"set t_Co=256                         " Enable 256 colors
"set termguicolors                    " Enable GUI colors for the terminal to get truecolor
set background=dark
colorscheme alduin
set relativenumber
set cursorline
hi clear SpellBad
