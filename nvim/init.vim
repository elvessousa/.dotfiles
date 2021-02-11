call plug#begin()
	" Appearance 
	Plug 'vim-airline/vim-airline'

	" Utilities
	Plug 'terryma/vim-multiple-cursors'
	Plug 'sheerun/vim-polyglot'

	" Completion and linters
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-pyclang'
	Plug 'neoclide/coc.nvim'
	Plug 'w0rp/ale'
	Plug 'jiangmiao/auto-pairs'

	" Git
	Plug 'tpope/vim-fugitive'
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
set ttimeoutlen=0
set mouse=a
set inccommand=split
set path+=**
set background=dark

" True color if available
if has('termguicolors') 
	set termguicolors
endif

" Color scheme and themes
colorscheme monokai_pro
let t_Co=256

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

" Tabs size
set tabstop=2
set shiftwidth=2
set expandtab

" Language server stuff
let g:ncm2_pyclang#library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc



" Remappings
nnoremap <F5> :Vex<CR>
nnoremap <F4> :q<CR>
nnoremap <C-F5> :source $VIMRUNTIME/init.vim<CR>
