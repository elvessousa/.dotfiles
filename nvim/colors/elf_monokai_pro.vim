" Vim color file
" Author: Elves Sousa
" Website: elvessousa.com.br
" Colorscheme Name: elf_monokai_pro
" Inspired by https://www.monokai.pro/

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "elf_monokai_pro"

" Color palette
" Interface
let s:lightest = "#ffffff"
let s:darkest = '#000000'
let s:bg = '#202020'
let s:accent = '#3a3a3a'
let s:splits = '#606060'
let s:lineNumber = '#333333'
let s:menu = '#303030'
let s:hover = '#5f5f5f'
let s:visual = '#4e4e4e'
let s:fold = '#262626'

" Syntax highlight colors
let s:str = '#fed76e'
let s:str2 = '#ff8700'
let s:int = '#ab9ff0'
let s:muted = '#666666'
let s:title = '#eeeeee'
let s:id = '#7cdce7'
let s:arg = '#aadb7b'
let s:word = '#fd6389'
let s:warn = '#fd6389'
let s:other = '#5f5f5f'
let s:file = '#cccccc'

" Text format
let s:b = 'bold'
let s:i = 'italic'
let s:u = 'underline'

" Set highlight colors function
function s:HL(scope, ...)
  let l:cfont = a:1
  let l:cback = a:2
  let l:style = a:3
  let l:back = a:4
  let l:font = a:5

  let l:colorizeCommand = [
        \ 'highlight', a:scope,
        \ 'guibg=' . l:back, 'ctermbg=' . l:cback,
        \ 'guifg=' . l:font, 'ctermfg=' . l:cfont,
        \ 'gui=' . l:style, 'cterm=' . l:style,
        \ 'guisp=NONE'
        \]
  execute join(l:colorizeCommand, ' ')
endfunction

" Apply colors
call s:HL("Boolean", 141, 'NONE', 'NONE', 'NONE', s:int)
call s:HL("Character", 141, 'NONE', 'NONE', 'NONE', s:int)
call s:HL("ColorColumn" , 'NONE', 237, 'NONE', s:accent, 'NONE')
call s:HL("Comment", 242, 'NONE', s:i, 'NONE', s:muted)
call s:HL("Conditional", 204, 'NONE', s:i, 'NONE', s:word)
call s:HL("Constant", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("Cursor" , 231, 231, 'NONE', s:lightest, s:lightest)
call s:HL("CursorColumn" , 'NONE', 237, 'NONE', s:accent, 'NONE')
call s:HL("CursorLine" , 'NONE', 237, 'NONE', s:accent, 'NONE')
call s:HL("CursorLineNr" , 'NONE', 237, 'NONE', 'NONE', s:muted)
call s:HL("Define", 204, 'NONE', 'NONE', 'NONE', s:word)
call s:HL("Directory", 141, 'NONE', 'NONE', 'NONE', s:str)
call s:HL("EndOfBuffer", 231, 235, 'NONE', s:bg, s:bg)
call s:HL("ErrorMsg", 231, 204, 'NONE', s:warn, s:lightest)
call s:HL("Float", 141, 'NONE', 'NONE', 'NONE', s:int)
call s:HL("Folded", 242, 235, 'NONE', s:fold, s:muted)
call s:HL("Function", 81, 'NONE', s:b, 'NONE', s:id)
call s:HL("Identifier", 81, 'NONE', s:i, 'NONE', s:id)
call s:HL("IncSearch", 16, 11, 'NONE', s:str, s:darkest)
call s:HL("Keyword", 204, 'NONE', s:i, 'NONE', s:word)
call s:HL("Label", 204, 'NONE', 'NONE', 'NONE', s:word)
call s:HL("LineNr" , 102, 235, 'NONE', s:bg, s:lineNumber)
call s:HL("MatchParen" , 11, 'NONE', s:u, 'NONE', s:str)
call s:HL("NonText", 59, 235, 'NONE', s:fold, s:other)
call s:HL("Normal", 231, 235, 'NONE', s:bg, s:lightest)
call s:HL("Number", 141, 'NONE', 'NONE', 'NONE', s:int)
call s:HL("Operator", 204, 'NONE', 'NONE', 'NONE', s:word)
call s:HL("Pmenu", 'NONE', 236, 'NONE', s:menu, 'NONE')
call s:HL("PmenuSel", 'NONE', 59, 'NONE', s:hover, 'NONE')
call s:HL("PreProc", 155, 'NONE', 'NONE', 'NONE', s:arg)
call s:HL("Search", 16, 11, 'NONE', s:str, s:darkest)
call s:HL("SignColumn", 'NONE', 237, 'NONE', s:bg, 'NONE')
call s:HL("Special", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("SpecialKey", 59, 237, 'NONE', s:accent, s:other)
call s:HL("Statement", 204, 'NONE', s:i, 'NONE', s:word)
call s:HL("StatusLine" , 231, 241, s:b, s:splits, s:lightest)
call s:HL("StatusLineNC" , 231, 241, 'NONE', s:splits, s:lightest)
call s:HL("StorageClass", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("String", 221, 'NONE', 'NONE', 'NONE', s:str)
call s:HL("Tag", 204, 'NONE', 'NONE', 'NONE', s:word)
call s:HL("Title", 255, 'NONE', s:b, 'NONE', s:title)
call s:HL("Todo", 11, 'NONE', 'NONE', s:str, 'NONE')
call s:HL("Type", 81, 'NONE', 'NONE', 'NONE', s:id, 'NONE')
call s:HL("Underlined", 'NONE', 'NONE', s:u, 'NONE', 'NONE')
call s:HL("VertSplit" , 241, 241, 'NONE', s:bg, s:splits)
call s:HL("Visual" , 'NONE', 239, 'NONE', s:visual, 'NONE')
call s:HL("WarningMsg", 231, 204, 'NONE', s:warn, s:lightest)

" Netrw File Browser
call s:HL("netrwTreeBar", 231, 204, 'NONE', 'NONE', s:bg)
call s:HL("netrwClassify", 231, 204, 'NONE', 'NONE', s:lineNumber)
call s:HL("netrwLink", 231, 204, 'NONE', 'NONE', s:muted)
call s:HL("netrwSlash", 231, 204, 'NONE', s:bg, s:bg)
call s:HL("netrwSymLink", 231, 204, s:i, 'NONE', s:arg)
call s:HL("netrwPlain", 242, 'NONE', 'NONE', 'NONE', s:file)

" Diffs
call s:HL("DiffAdd", 231, 155, s:b, 'NONE', s:arg)
call s:HL("DiffChange", 'NONE', 'NONE', 'NONE', 'NONE', s:str2)
call s:HL("DiffDelete", 204, 'NONE', 'NONE', 'NONE', s:warn)
call s:HL("DiffText", 231, 24, s:b, s:id, s:lightest)

" Ruby
call s:HL("erubyComment", 95, 'NONE', 'NONE', 'NONE', s:muted)
call s:HL("erubyDelimiter", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("erubyRailsMethod", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("rubyBlockParameter", 208, 'NONE', 'NONE', 'NONE', s:str2)
call s:HL("rubyClass", 204, 'NONE', 'NONE', 'NONE', s:word)
call s:HL("rubyClassVariable", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("rubyConstant", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("rubyControl", 204, 'NONE', 'NONE', 'NONE', s:word)
call s:HL("rubyEscape", 141, 'NONE', 'NONE', 'NONE', s:int)
call s:HL("rubyException", 204, 'NONE', 'NONE', 'NONE', s:word)
call s:HL("rubyFunction", 155, 'NONE', 'NONE', 'NONE', s:arg)
call s:HL("rubyGlobalVariable", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("rubyInclude", 204, 'NONE', 'NONE', 'NONE', s:word)
call s:HL("rubyInstanceVariable", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("rubyInterpolationDelimiter", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("rubyOperator", 204, 'NONE', 'NONE', 'NONE', s:word)
call s:HL("rubyPseudoVariable", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("rubyRailsARAssociationMethod", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("rubyRailsARMethod", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("rubyRailsMethod", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("rubyRailsRenderMethod", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("rubyRailsUserClass", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("rubyRegexp", 11, 'NONE', 'NONE', 'NONE', s:str)
call s:HL("rubyRegexpDelimiter", 11, 'NONE', 'NONE', 'NONE', s:str)
call s:HL("rubyStringDelimiter", 11, 'NONE', 'NONE', 'NONE', s:str)
call s:HL("rubySymbol", 141, 'NONE', 'NONE', 'NONE', s:int)

" HTML 
call s:HL("htmlArg", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("htmlEndTag", 245, 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("htmlSpecialChar", 141, 'NONE', 'NONE', 'NONE', s:int)
call s:HL("htmlTag", 245, 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("htmlTagName", 204, 'NONE', 'NONE', 'NONE', s:word)

" JavaScript
call s:HL("javaScriptBraces", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("javaScriptFunction", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("javaScriptRailsFunction", 81, 'NONE', 'NONE', 'NONE', s:id)

" YAML
call s:HL("yamlAlias", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("yamlAnchor", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("yamlDocumentHeader", 11, 'NONE', 'NONE', 'NONE', s:str)
call s:HL("yamlKey", 204, 'NONE', 'NONE', 'NONE', s:word)

" Cascading Style Sheets
call s:HL("cssBraces", 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL("cssClassName", 155, 'NONE', 'NONE', 'NONE', s:arg)
call s:HL("cssColor", 141, 'NONE', 'NONE', 'NONE', s:int)
call s:HL("cssCommonAttr", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("cssFunctionName", 81, 'NONE', 'NONE', 'NONE', s:id)
call s:HL("cssPseudoClassId", 155, 'NONE', 'NONE', 'NONE', s:arg)
call s:HL("cssURL", 208, 'NONE', 'NONE', 'NONE', s:str2)
call s:HL("cssValueLength", 141, 'NONE', 'NONE', 'NONE', s:int)

