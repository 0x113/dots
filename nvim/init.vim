" ---------- PLUGINS -----------
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'tell-k/vim-autopep8'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex'  }
" ------------------------------

" ---------- COLORS ------------
Plug 'chriskempson/base16-vim'
Plug 'endel/vim-github-colorscheme'
Plug 'arcticicestudio/nord-vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'ayu-theme/ayu-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'

call plug#end()
" ------------------------------

" ------------ PLUGIN CONFIG ------------
"1) nerdtree
map <F8> :NERDTreeToggle<CR>
let base16colorspace=256

"2) emmet
" autocomplete on tab
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"3) autopep8
autocmd FileType python noremap <buffer> <F3> :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1

"4) airline
"let g:airline#extensions#tabline#enabled = 0
"let g:airline_theme='sol'

"7) deoplete
let g:deoplete#disable_auto_complete = 0
let g:deoplete#enable_at_startup = 1
setlocal omnifunc=go#complete#Complete
let g:deoplete#sources#go#gocode_binary = '/home/xa0s/Code/Go/bin/gocode'

autocmd FileType python
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

"8) vim-latext-live-preview
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'zathura'
"let g:livepreview_engine = 'pdflatex'

"9) Goyo
let g:goyo_width = "80%"
let g:goyo_height = "90%"
let g:goyo_lineaer = 0

"10) IndentLine
let g:indentLine_enabled = 0
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
" ---------------------------------------


" ------------ BINDINGS -----------
" split layout navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tabs binding
map <C-t> :tabnew <Enter>
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>

map <C-S-Right> <Esc>:vertical resize +5<Enter>
map <C-S-Left> <Esc>:vertical resize -5<Enter>

" run code
nnoremap <silent> <F5> :!python3 %<CR>
nnoremap <silent> <F6> :!go run %<CR>
" ---------------------------------


" ----------- INDENTION -----------
filetype plugin indent on

syntax on
set showmatch
set ts=4
set sts=4
set sw=4
set autoindent
set smartindent
set smarttab
set expandtab

set expandtab ts=4 sw=4 ai

autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype gohtml setlocal ts=2 sw=2 expandtab
" ----------------------------------

" ------------------------ LIGHTLINE ---------------------------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'OldHope',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'ok',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
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

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ''
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
       return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
           \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
           \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

autocmd User ALELint call lightline#update()

" ale + lightline
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d --', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d >>', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

function! s:syntastic()
  SyntasticCheck
    call lightline#update()
endfunction

" -------------- FIXES -------------
" disable backup
set backupdir-=.
set backupdir^=~/tmp,/tmp
set nobackup
set nowritebackup
set noswapfile

" fish shell fix
set shell=/bin/bash
" ---------------------------------
" --------------- UI ---------------
syntax on
set encoding=utf-8
set termguicolors
let base16colorspace=256
let g:seoul256_background = 233
let g:seoul256_light_background = 256

colo deep-space
set background=dark
"colorscheme agila
set noshowmode

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePost *.tex !pdflatex % <afile>

" disable highlight for search
set nohlsearch

hi Function gui=NONE
hi Comment gui=NONE

set relativenumber
set number
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"

" disable func parameters
set completeopt-=preview

set guicursor=
" ----------------------------------
