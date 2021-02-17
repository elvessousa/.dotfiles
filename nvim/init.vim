call plug#begin()
	" Appearance 
	Plug 'vim-airline/vim-airline'

	" Utilities
	Plug 'terryma/vim-multiple-cursors'
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
	Plug 'ap/vim-css-color'

	" Completion and linters
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-pyclang'
	Plug 'neoclide/coc.nvim'
	Plug 'w0rp/ale'

	" Git
	Plug 'airblade/vim-gitgutter'
call plug#end()

" Window stuff
filetype plugin indent on
syntax on
set nocompatible
set lazyredraw
set ttyfast
set splitbelow splitright
set hidden
set title
set number
set relativenumber
set cursorline
set ttimeoutlen=0
set mouse=a
set inccommand=split
set path+=**
set background=dark
set wildmenu

" True color if available
let term_program=$TERM_PROGRAM

if term_program != 'Apple_Terminal'
	set termguicolors
else
	if $TERM != 'xterm-256color'
		set termguicolors
	endif
endif

" Color scheme and themes
let t_Co=256
colorscheme elf_theme

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" File browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'

" Tabs size
set tabstop=2
set shiftwidth=2
set expandtab

" Language server stuff
let g:ncm2_pyclang#library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Leader
let mapleader=','

" Remappings
nnoremap <F5> :Vex<CR>
nnoremap <F4> :q!<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Show highlight groups
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
