" Vim color file
" Author: Erichain
" Colorscheme Name: monokai_pro
" Inspired by https://www.monokai.pro/

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "monokai_pro"

hi Cursor ctermfg=231 ctermbg=231 cterm=NONE guibg=#ffffff guifg=#ffffff guisp=NONE gui=NONE
hi Visual ctermfg=NONE ctermbg=239 cterm=NONE guibg=#4e4e4e guifg=NONE guisp=NONE gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guibg=#3a3a3a guifg=NONE guisp=NONE gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guibg=#3a3a3a guifg=NONE guisp=NONE gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guibg=#3a3a3a guifg=NONE guisp=NONE gui=NONE
hi LineNr ctermfg=102 ctermbg=235 cterm=NONE guibg=#202020 guifg=#333333 guisp=NONE gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guibg=#606060 guifg=#606060 guisp=NONE gui=NONE
hi MatchParen ctermfg=11 ctermbg=NONE cterm=underline guibg=NONE guifg=#fed76e guisp=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guibg=#606060 guifg=#ffffff guisp=NONE gui=NONE
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guibg=#606060 guifg=#ffffff guisp=NONE gui=NONE
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guibg=#303030 guifg=NONE guisp=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guibg=#5f5f5f guifg=NONE guisp=NONE gui=NONE
hi IncSearch ctermfg=16 ctermbg=11 cterm=NONE guibg=#fed76e guifg=#000000 guisp=NONE gui=NONE
hi Search ctermfg=16 ctermbg=11 cterm=NONE guibg=#fed76e guifg=#000000 guisp=NONE gui=NONE
hi Directory ctermfg=141 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ab9ff0 guisp=NONE gui=NONE
hi Folded ctermfg=242 ctermbg=235 cterm=NONE guibg=#262626 guifg=#666666 guisp=NONE gui=NONE
hi SignColumn ctermfg=NONE ctermbg=237 cterm=NONE guibg=#3a3a3a guifg=NONE guisp=NONE gui=NONE
hi Normal ctermfg=231 ctermbg=235 cterm=NONE guibg=#202020 guifg=#ffffff guisp=NONE gui=NONE
hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ab9ff0 guisp=NONE gui=NONE
hi Character ctermfg=141 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ab9ff0 guisp=NONE gui=NONE
hi Comment ctermfg=242 ctermbg=NONE cterm=italic guibg=NONE guifg=#666666 guisp=NONE gui=italic
hi Conditional ctermfg=204 ctermbg=NONE cterm=italic guibg=NONE guifg=#fd6389 guisp=NONE gui=italic
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi Define ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=155 cterm=bold guibg=#aadb7b guifg=#ffffff guisp=NONE gui=bold
hi DiffDelete ctermfg=204 ctermbg=NONE cterm=NONE guibg=#fd6389 guifg=NONE guisp=NONE gui=NONE
hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guibg=#7cdce7 guifg=#ffffff guisp=NONE gui=bold
hi ErrorMsg ctermfg=231 ctermbg=204 cterm=NONE guibg=#fd6389 guifg=#ffffff guisp=NONE gui=NONE
hi WarningMsg ctermfg=231 ctermbg=204 cterm=NONE guibg=#fd6389 guifg=#ffffff guisp=NONE gui=NONE
hi Float ctermfg=141 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ab9ff0 guisp=NONE gui=NONE
hi Function ctermfg=81 ctermbg=NONE cterm=bold guibg=NONE guifg=#7cdce7 guisp=NONE gui=bold
hi Identifier ctermfg=81 ctermbg=NONE cterm=italic guibg=NONE guifg=#7cdce7 guisp=NONE gui=italic
hi Keyword ctermfg=204 ctermbg=NONE cterm=italic guibg=NONE guifg=#fd6389 guisp=NONE gui=italic
hi Label ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=235 cterm=NONE guibg=#262626 guifg=#5f5f5f guisp=NONE gui=NONE
hi Number ctermfg=141 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ab9ff0 guisp=NONE gui=NONE
hi Operator ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi PreProc ctermfg=155 ctermbg=NONE cterm=NONE guibg=NONE guifg=#aadb7b guisp=NONE gui=NONE
hi Special ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=237 cterm=NONE guibg=#3a3a3a guifg=#5f5f5f guisp=NONE gui=NONE
hi Statement ctermfg=204 ctermbg=NONE cterm=italic guibg=NONE guifg=#fd6389 guisp=NONE gui=italic
hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi String ctermfg=221 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fed76e guisp=NONE gui=NONE
hi Tag ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi Title ctermfg=255 ctermbg=NONE cterm=bold guibg=NONE guifg=#eeeeee guisp=NONE gui=bold
hi Todo ctermfg=11 ctermbg=NONE guibg=NONE guifg=#fed76e guisp=NONE gui=NONE
hi Type ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi rubyClass ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi rubyFunction ctermfg=155 ctermbg=NONE cterm=NONE guibg=NONE guifg=#aadb7b guisp=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi rubySymbol ctermfg=141 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ab9ff0 guisp=NONE gui=NONE
hi rubyConstant ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi rubyStringDelimiter ctermfg=11 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fed76e guisp=NONE gui=NONE
hi rubyBlockParameter ctermfg=208 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ff8700 guisp=NONE gui=NONE
hi rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi rubyInclude ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi rubyRegexp ctermfg=11 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fed76e guisp=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=11 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fed76e guisp=NONE gui=NONE
hi rubyEscape ctermfg=141 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ab9ff0 guisp=NONE gui=NONE
hi rubyControl ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi rubyOperator ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi rubyException ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi rubyRailsUserClass ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi rubyRailsARMethod ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi rubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi erubyComment ctermfg=95 ctermbg=NONE cterm=NONE guibg=NONE guifg=#666666 guisp=NONE gui=NONE
hi erubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi htmlTag ctermfg=245 ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi htmlEndTag ctermfg=245 ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi htmlTagName ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi htmlArg ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi htmlSpecialChar ctermfg=141 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ab9ff0 guisp=NONE gui=NONE
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi yamlKey ctermfg=204 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fd6389 guisp=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE
hi yamlDocumentHeader ctermfg=11 ctermbg=NONE cterm=NONE guibg=NONE guifg=#fed76e guisp=NONE gui=NONE
hi cssURL ctermfg=208 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ff8700 guisp=NONE gui=NONE
hi cssFunctionName ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi cssColor ctermfg=141 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ab9ff0 guisp=NONE gui=NONE
hi cssPseudoClassId ctermfg=155 ctermbg=NONE cterm=NONE guibg=NONE guifg=#aadb7b guisp=NONE gui=NONE
hi cssClassName ctermfg=155 ctermbg=NONE cterm=NONE guibg=NONE guifg=#aadb7b guisp=NONE gui=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE guibg=NONE guifg=#ab9ff0 guisp=NONE gui=NONE
hi cssCommonAttr ctermfg=81 ctermbg=NONE cterm=NONE guibg=NONE guifg=#7cdce7 guisp=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE guisp=NONE gui=NONE

