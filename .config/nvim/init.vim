set nocompatible

syntax on

set mouse=a

set autoindent smartindent expandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set lbr
set nowrap
set nohls

set autoread autowrite
set splitbelow

set noignorecase
set nobackup noswapfile

set hidden

set sw=2 ts=2 ai si

let mapleader = ","

let g:coc_disable_startup_warning = 1


""" File type associations

au BufRead,BufNewFile *.md set filetype=markdown wrap lbr
au BufRead,BufNewFile *.p set filetype=text
au BufRead,BufNewFile *.pawn set filetype=c
au BufRead,BufNewFile *.text set filetype=markdown
au BufRead,BufNewFile *.svelte set filetype=html
au BufRead,BufNewFile TODO set ft=text
au BufRead,BufNewFIle */templates/*.html set ft=htmldjango
au BufRead,BufNewFile *.cpp,*.h,*.cc set tags+=/usr/include/tags
au BufRead,BufNewFile *.ds set ft=haskell
au BufRead,BufNewFile *.emblem set filetype=haml
au BufRead,BufNewFile *.hbs set filetype=html
au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
au BufRead,BufNewFile *.ll set filetype=llvm
au BufRead /usr/include/c++/* set ft=cpp
au BufRead,BufNewFile *.ts set ft=javascript
au BufRead COMMIT_EDITMSG exe "normal! gg"
filetype plugin indent on

""" Jump to last position in the file
" taken from default Debian /etc/vim/vimrc
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let g:purescript_indent_if = 2
let g:purescript_indent_case = 2
let g:purescript_indent_let = 2
let g:purescript_indent_in = 0
let g:purescript_indent_where = 6
let g:purescript_indent_do = 2

""" Git stuff
nnoremap  :Ggrep<space>
map C :Gwrite<cr>:Git commit<cr>
nnoremap W :Gwrite<cr>

""" Fast write and quit
nnoremap ;q :q<cr>
nnoremap ;w :w<cr>
nnoremap ;x :x<cr>
nnoremap ; :

""" Haskell syntax highlighting
let hs_allow_hash_operator=1

"nnoremap <C-d> :silent !tmux new-window 'bash; i3-msg focus left'; i3-msg focus right<cr>:redraw!<cr>

" {{{ fzf key mappings
nnoremap <C-p><C-f> :GFiles<cr>
nnoremap <C-p><C-t> :Tags<cr>
nnoremap <C-p><C-m> :History<cr>
" }}}
 
let g:camelcasemotion_key = ','

" Fast switching between alternate files
nnoremap <Tab> <C-^>

source ~/.config/nvim/autoload/plug.vim

colorscheme nofrils-light
colorscheme desert | set bg=light

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes
" TODO: pin these, or just use vim packages feature

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'benizi/vim-automkdir'
Plug 'bkad/CamelCaseMotion'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" TODO: Plug 'tpope/vim-rhubarb' - requires `hub`, find replacement which uses
" `gh`

" TODO: add Purescript language server

" Initialize plugin system
call plug#end()

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

lua << EOF
require'lspconfig'.pyright.setup{}
EOF
