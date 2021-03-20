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
	Plug 'elixir-editors/vim-elixir'
	Plug 'neoclide/coc.nvim'
	Plug 'w0rp/ale'

	" Git
	Plug 'airblade/vim-gitgutter'
call plug#end()

" Window stuff
filetype plugin indent on
syntax on

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

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
	set termguicolors
else
	if $TERM !=? 'xterm-256color'
		set termguicolors
	endif
endif

" Color scheme and themes
let t_Co = 256
colorscheme sobrio
let g:airline_theme='sobrio'
let g:airline_powerline_fonts = 1
" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" File browser
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'

" Create file without opening buffer
function! CreateInPreview()
  let l:filename = input('please enter filename: ')
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename 
  redraw!
endf

" Tabs size
set tabstop=2
set shiftwidth=2
set expandtab

" Language server stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
set completeopt=noinsert,menuone,noselect

" Leader
let mapleader=','

" Remappings
nnoremap <F5> :Vex<CR>
nnoremap <F4> :q!<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

"" Tabs
let g:airline#extensions#tabline#enabled = 1
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Netrw: create file using touch instead of opening a buffer
function! Netrw_mappings()
  noremap <buffer>% :call CreateInPreview()<cr>
endfunction

" Show highlight groups
map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Auto Commands
augroup auto_commands
	autocmd FileType scss setl iskeyword+=@-@
	autocmd BufEnter * call ncm2#enable_for_buffer()
	autocmd filetype netrw call Netrw_mappings()
augroup END
