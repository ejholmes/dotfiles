set background=light

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "basic"


hi LineNr       guifg=#cccc00 guibg=white
hi Include      guifg=#cc00cc
hi Question     guifg=#00cc00
hi Title        guifg=#cc00cc
hi Warning      guifg=#cc0000
hi Folded       guifg=#0000cc
hi FoldedColumn guifg=#0000cc
hi Pmenu        guibg=#cc00cc
hi Comment      guifg=#0000cc
hi Constant     guifg=#cc0000
hi Special      guifg=#cc00cc
hi Identifier   guifg=#00cccc
hi Statement    guifg=#cccc00
hi PreProc      guifg=#cc00cc
hi Type         guifg=#445588
hi Underlined   guifg=#cc00cc gui=underline
hi Todo         guibg=#cccc00
hi Function     guifg=#990000 gui=bold
hi link         String        Constant
hi link         Character     Constant
hi link         Boolean       Constant
hi link         Number        Constant
hi link         Float         Constant
"hi link         Function      Identifier
hi link         Conditional   Statement
hi link         Repeat        Statement
hi link         Label         Statement
hi link         Operator      Statement
hi link         Keyword       Statement
hi link         Exception     Statement
hi link         Include       PreProc
hi link         Define        PreProc
hi link         Macro         PreProc
hi link         PreCondit     PreProc
hi default      ShowMarksHLl  ctermfg=darkblue ctermbg=blue cterm=bold guifg=blue guibg=white gui=bold
hi default      ShowMarksHLu  ctermfg=darkblue ctermbg=blue cterm=bold guifg=blue guibg=white gui=bold
hi default      ShowMarksHLo  ctermfg=darkblue ctermbg=blue cterm=bold guifg=blue guibg=white gui=bold
hi default      ShowMarksHLm  ctermfg=darkblue ctermbg=blue cterm=bold guifg=blue guibg=white gui=bold
hi SignColumn   guibg=white
