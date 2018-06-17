" Dennis' init.vim
"
" :)

" install vim-plug if it's not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" start vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" load plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/promptline.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/syntastic'
Plug 'jaxbot/syntastic-react'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'styled-components/vim-styled-components'
Plug 'neoclide/vim-jsx-improve'
Plug 'elzr/vim-json'
Plug 'posva/vim-vue'
Plug 'hallison/vim-markdown'
Plug 'lilydjwg/colorizer'
Plug 'rstacruz/vim-closer'
Plug 'tomasr/molokai'
Plug 'haya14busa/incsearch.vim'
Plug 'terryma/vim-multiple-cursors'

" finish loading plugins
call plug#end()

" automatically install plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" various nvim preferences for common usage
set title
set number
set encoding=utf8
set mouse=a
set whichwrap+=<,>,h,l,[,]
set guifont=FuraCode\ Nerd\ Font\ Regular\ 15
set ttimeoutlen=50
set tabstop=2 shiftwidth=2 expandtab
set termguicolors
set hidden
set noshowmode

" set no highlight after search
let g:incsearch#auto_nohlsearch = 1

" hide netrw banner
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" automatically set PWD to root of project
autocmd BufEnter * :Rooter

" vim-airline preferences - buffer only, no tabs
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#promptline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_symbols.space="\ua0"


" Keymappings
let mapleader = "zz"
map <silent> <C-d> :Explore<CR>
map <silent> <A-Space> :bnext<CR>
map <silent> <C-Space> :bprevious<CR>

if !exists(expand('%'))
  nnoremap <silent> <Leader>q :q! <CR>
else
nnoremap <silent> <Leader>q :wq! <CR>
endif

nnoremap <silent> <Leader>z :bd! <CR>

" Terminal keymappings

" check for git directory and change to it if it exists
" then launch terminal, else cd into path of current file
" then launch terminal

if !exists("b:git_dir")
  nnoremap <silent> <C-z> :lcd %:p:h <CR> :edit term://zsh <CR>
else 
  nnoremap <silent> <C-z> :Gcd <CR> :edit term://zsh <CR>
endif

" close terminal if in terminal mode
tnoremap <silent> <C-z> <C-\><C-n> :bd! <CR>

" exit terminal mode but leave terminal open
tnoremap <silent> <Leader>z <C-\><C-n> <CR>

autocmd TermOpen * startinsert

" Persistent Undo
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile



" Set colorscheme last
colorscheme molokai


