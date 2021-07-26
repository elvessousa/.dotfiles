call plug#begin()
	" Appearance 
	Plug 'vim-airline/vim-airline'
	Plug 'ryanoasis/vim-devicons'

	" Utilities
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'ap/vim-css-color'
	Plug 'preservim/nerdtree'

	" Completion / linters / formatters
	Plug 'neoclide/coc.nvim'
	" Plug 'w0rp/ale'
	" Plug 'dense-analysis/ale'
	Plug 'plasticboy/vim-markdown'

	" Git
	Plug 'airblade/vim-gitgutter'
call plug#end()

" Window stuff
filetype plugin indent on
syntax on

" Options
set background=dark
set clipboard=unnamedplus
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set path+=**
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
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
let NERDTreeShowHidden=1

" Create file without opening buffer
function! CreateInPreview()
  let l:filename = input('please enter filename: ')
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename 
  redraw!
endfunction

" Tabs size
set tabstop=2
set shiftwidth=2
set expandtab

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']

" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" Language server stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
set completeopt=noinsert,menuone,noselect

" Leader
let mapleader=','

" Normal mode remappings
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F4> :bd<CR>
nnoremap <C-q> :q!<CR>
nnoremap <F6> :sp<CR>:terminal<CR>
nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>

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
	autocmd filetype netrw call Netrw_mappings()
augroup END
