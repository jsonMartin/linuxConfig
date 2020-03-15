" Set Leader key
let maplocalleader = '\'
let mapleader = '\'

" ------------------------------------------------------------
" PLUGINS BEGIN
" ------------------------------------------------------------
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'vifm/vifm.vim'

" Syntastic
Plug 'vim-syntastic/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'easymotion/vim-easymotion'
Plug 'dkarter/bullets.vim' " Bullet points & number lists
Plug 'Rigellute/shades-of-purple.vim' " Color Theme; Plug 'dracula/vim'

" Airline (bottom stats tab)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" FZF
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Peekaboo (shows content of registers when using "/@ in normal mode and CTRL-R in insert mode)
Plug 'junegunn/vim-peekaboo'

" Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_switch_buffer = 'et' " Opens same file in new buffer

" Auto Pairs
Plug 'jiangmiao/auto-pairs' " https://github.com/jiangmiao/auto-pairs

" Ack
Plug 'mileszs/ack.vim' " For the :Ack command

call plug#end()
" ------------------------------------------------------------
" PLUGINS END
" ------------------------------------------------------------

let g:airline_powerline_fonts = 1 " For airline fonts
set bg=light
set mouse=a
" "set nrformats= " Treat all number strings as decimals (to ignore octals etc)

"" Some basics:
	filetype plugin on
	set encoding=utf-8
	set number relativenumber
"" Enable autocompletion:
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
 	set splitbelow splitright

" " Nerd tree
	map <leader>N :NERDTreeToggle<CR>
"" 	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""
" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Automatically deletes all trailing whitespace on save.
 	autocmd BufWritePre * %s/\s\+$//e

" Shades of Purple Theme
"if (has("termguicolors"))
 "set termguicolors
"endif

set termguicolors

" Correct RGB escape codes for vim inside tmux
if !has('nvim') && $TERM ==# 'screen-256color'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif



syntax enable
colorscheme shades_of_purple " Other options: dracula
let g:shades_of_purple_airline=1
let g:airline_theme='shades_of_purple'

" Folds
" Start out with all folds expanded
set foldlevelstart=0
set foldlevel=0
" Folding Colors
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Rebind F1 to open the menu similar to VSCode
nmap <F1> :
nmap <F2> :set paste!<CR>
nmap <C-b> <C-v>

" FZF bindings
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Easymotion bindings
nmap <space> <Plug>(easymotion-bd-w)
nmap <space> <Plug>(easymotion-jumptoanywhere)
nmap <Leader>j <Leader><Leader>j
nmap <Leader>k <Leader><Leader>k
nmap <Leader><Leader><Leader>bdb <Plug>(easymotion-bd-w)
nmap <Leader><Leader><Leader>bde <Plug>(easymotion-bd-e)
nmap <Leader><Leader><Leader>bdw <Plug>(easymotion-bd-w)
nmap <Leader>b <Plug>(easymotion-bd-w)
nmap <Leader>e <Plug>(easymotion-bd-e)
nmap <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>f <Leader><Leader>s
nmap <Leader>s <Leader><Leader>s
nmap <Leader>t <Leader><Leader>t
nmap <Leader>2t <Plug>(easymotion-t2)
nmap <Leader><Leader>2t <Plug>(easymotion-t2)
nmap <Leader>2s <Plug>(easymotion-s2)
nmap <Leader><Leader>2s <Plug>(easymotion-s2)
nmap <Leader><Leader><Leader>bde <Plug>(easymotion-bd-e)
nmap <Leader>G <Plug>(easymotion-bd-jk)
nmap <Leader>g <Plug>(easymotion-bd-jk)
nmap <Leader>n <Plug>(easymotion-bd-n)


" Makes VI toggle paste mode during paste
set pastetoggle=<f3>
set showcmd " Shows command that is being typed

" Settings for syntax highlighter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" --------------------------
" |   CODE GRAVEYARD
" --------------------------

"" Settings Leaving off for now..
" set nohlsearch
" " set clipboard=unnamed
" set clipboard=unnamedplus
" set nocompatible

" " Goyo plugin makes text more readable when writing prose:
" 	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
"

" Replace all is aliased to S.
	" nnoremap S :%s//g<Left><Left>

" " Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
" 	vnoremap <C-c> "+y
" 	map <C-v> "+P
"	nnoremap c "_c
