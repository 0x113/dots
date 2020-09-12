call plug#begin('~/.vim/plugged')
" ------------ PLUGINS -----------

" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" NerdTree
Plug 'scrooloose/nerdtree'

" Wakatime
Plug 'wakatime/vim-wakatime'

" Emmet
Plug 'mattn/emmet-vim'

" Goyo
Plug 'junegunn/goyo.vim'
let g:goyo_width = "80%"
let g:goyo_height = "90%"
let g:goyo_lineaer = 0

" Limelight
Plug 'junegunn/limelight.vim'
let g:limelight_default_coefficient = 0.5
let g:limelight_paragraph_span = 0    " include preceding/following paragraphs
let g:limelight_priority       = 10    " -1 to hlsearch highlight all paragraphs, 1 per paragraph

" ------------ COLORS ------------
Plug 'relastle/bluewery.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'gosukiwi/vim-atom-dark'
Plug 'arzg/vim-colors-xcode'
Plug 'morhetz/gruvbox'
Plug 'hardselius/warlock'
Plug 'liuchengxu/space-vim-dark'
Plug 'nanotech/jellybeans.vim'
Plug 'fxn/vim-monochrome'
Plug 'challenger-deep-theme/vim'
Plug 'NerdyPepper/vim-colors-plain'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim'
Plug 'nightsense/cosmic_latte'
Plug 'joshdick/onedark.vim'

" NerdTree config
nnoremap <C-p> :NERDTreeToggle<CR>

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
map <C-_> <Esc>:tabprev<CR>
map <C-\> <Esc>:tabnext<CR>

let g:go_highlight_trailing_whitespace_error=0
au InsertEnter *.go match goSpaceError /\s\+\%#\@<!$/
au InsertLeave *.go match goSpaceError /\s\+$/

hi Error NONE 
autocmd BufWritePost *.tex !xelatex -output-directory pdfs/ % <afile>

" vue
autocmd Filetype vue setlocal ts=2 sw=2 expandtab

syntax on
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor
let g:seoul256_background = 233
let ayucolor="dark"   " for dark version of theme
colo xcodedarkhc
hi LineNr ctermbg=NONE guibg=NONE
set background=dark
set relativenumber
"set cursorline
hi clear SpellBad
set t_md=

