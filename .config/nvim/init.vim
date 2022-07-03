let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'maralla/completor.vim'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'preservim/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'arcticicestudio/nord-vim'
Plug 'baskerville/vim-sxhkdrc'
Plug 'strboul/urlview.vim'
Plug 'vim-syntastic/syntastic'
call plug#end()

set go+=a
set mouse+=a
set nohlsearch
set clipboard+=unnamedplus

set bg=dark
colorscheme nord
set cursorline

filetype plugin on

set nocompatible
syntax on
set encoding=utf-8
set number relativenumber

set tabstop=8
set softtabstop=8

set wildmode=longest,list,full

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

map <leader>f :Goyo \| set linebreak<CR>

map <leader>p :setlocal spell! spelllang=en_us<CR>

set splitbelow splitright

map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

autocmd BufWritePre * %s/\s\+$//e

autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

autocmd BufWritePost *xresources !xrdb -merge %

autocmd BufWritePost */webpage/*/*.md,*/webpage/*/*.html,*/webpage/*/conf ! sed -i "s/^date_updated=.*/date_updated=$(date +"\"\%a, \%d \%b \%Y \%H:\%M:\%S \%z\"")/" %:p:h/conf

" Recompile dwmblocks on config edit.
autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set noshowmode

" Open corresponding .pdf/.html or preview
	map <leader>o :!opout <c-r>%<CR><CR>

" Navigating with guides
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

autocmd! User GoyoEnter nested set eventignore=FocusGained
autocmd! User GoyoLeave nested set eventignore=

let g:completor_clang_binary = '/usr/bin/clang'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

let g:rainbow_active = 1

let g:airline#extensions#tagbar#enabled = 1

nmap <F8> :TagbarToggle<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

