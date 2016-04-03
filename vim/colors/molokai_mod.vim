" This scheme was created by CSApproxSnapshot
" on Fri, 12 Dec 2008

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = 'molokai_mod'

if 0
elseif has("gui_running") || &t_Co == 256
    highlight Normal term=NONE cterm=NONE ctermbg=234 ctermfg=231
    highlight SpecialKey term=NONE cterm=NONE ctermbg=bg ctermfg=102
    highlight NonText term=bold cterm=bold ctermbg=235 ctermfg=250
    highlight Directory term=bold cterm=bold ctermbg=bg ctermfg=148
    highlight ErrorMsg term=bold cterm=bold ctermbg=235 ctermfg=197
    highlight IncSearch term=NONE cterm=NONE ctermbg=180 ctermfg=16
    highlight Search term=NONE cterm=NONE ctermbg=59 ctermfg=231
    highlight MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=186
    highlight ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=186
    highlight LineNr term=NONE cterm=NONE ctermbg=235 ctermfg=250
    highlight MatchParen term=bold cterm=bold ctermbg=208 ctermfg=16
    highlight Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=81
    highlight PmenuSel term=NONE cterm=NONE ctermbg=244 ctermfg=fg
    highlight PmenuSbar term=NONE cterm=NONE ctermbg=16 ctermfg=fg
    highlight PmenuThumb term=NONE cterm=NONE ctermbg=81 ctermfg=bg
    highlight CursorColumn term=NONE cterm=NONE ctermbg=16 ctermfg=fg
    highlight CursorLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg
    highlight Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16
    highlight Comment term=NONE cterm=NONE ctermbg=bg ctermfg=59
    highlight Identifier term=NONE cterm=NONE ctermbg=bg ctermfg=208
    highlight Statement term=bold cterm=bold ctermbg=bg ctermfg=197
    highlight PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=148
    highlight Type term=NONE cterm=NONE ctermbg=bg ctermfg=81
    highlight Operator term=NONE cterm=NONE ctermbg=bg ctermfg=197
    highlight Keyword term=bold cterm=bold ctermbg=bg ctermfg=197
    highlight Underlined term=underline cterm=underline ctermbg=bg ctermfg=244
    highlight Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=244
    highlight Error term=NONE cterm=NONE ctermbg=16 ctermfg=89
    highlight Todo term=bold cterm=bold ctermbg=bg ctermfg=231
    highlight String term=NONE cterm=NONE ctermbg=bg ctermfg=186
    highlight Number term=NONE cterm=NONE ctermbg=bg ctermfg=141
    highlight Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=141
    highlight Float term=NONE cterm=NONE ctermbg=bg ctermfg=141
    highlight Function term=NONE cterm=NONE ctermbg=bg ctermfg=148
    highlight Title term=bold cterm=bold ctermbg=bg ctermfg=203
    highlight Conditional term=bold cterm=bold ctermbg=bg ctermfg=197
    highlight Repeat term=bold cterm=bold ctermbg=bg ctermfg=197
    highlight Label term=NONE cterm=NONE ctermbg=bg ctermfg=186
    highlight Exception term=bold cterm=bold ctermbg=bg ctermfg=148
    highlight Define term=NONE cterm=NONE ctermbg=bg ctermfg=81
    highlight Macro term=NONE cterm=NONE ctermbg=bg ctermfg=180
    highlight PreCondit term=bold cterm=bold ctermbg=bg ctermfg=148
    highlight StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=208
    highlight Structure term=NONE cterm=NONE ctermbg=bg ctermfg=81
    highlight Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=81
    highlight Tag term=NONE cterm=NONE ctermbg=bg ctermfg=197
    highlight SpecialChar term=bold cterm=bold ctermbg=bg ctermfg=197
    highlight Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=245
    highlight SpecialComment term=bold cterm=bold ctermbg=bg ctermfg=59
    highlight Debug term=bold cterm=bold ctermbg=bg ctermfg=145
    highlight Constant term=bold cterm=bold ctermbg=bg ctermfg=141
    highlight DiffChange term=NONE cterm=NONE ctermbg=59 ctermfg=102
    highlight Special term=NONE cterm=NONE ctermbg=bg ctermfg=81
    highlight Character term=NONE cterm=NONE ctermbg=bg ctermfg=186
    highlight Question term=bold cterm=bold ctermbg=bg ctermfg=81
    highlight StatusLine term=bold cterm=bold ctermbg=59 ctermfg=fg
    highlight StatusLineNC term=NONE cterm=NONE ctermbg=244 ctermfg=16
    highlight VertSplit term=bold cterm=bold ctermbg=16 ctermfg=244
    highlight Visual term=NONE cterm=NONE ctermbg=59 ctermfg=fg
    highlight VisualNOS term=bold,underline cterm=bold,underline ctermbg=59 ctermfg=fg
    highlight WarningMsg term=bold cterm=bold ctermbg=236 ctermfg=231
    highlight WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=81
    highlight Folded term=NONE cterm=NONE ctermbg=16 ctermfg=59
    highlight SpellBad term=undercurl cterm=undercurl ctermbg=bg ctermfg=196
    highlight FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=59
    highlight DiffAdd term=NONE cterm=NONE ctermbg=23 ctermfg=fg
    highlight DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=89
    highlight DiffText term=bold cterm=bold ctermbg=59 ctermfg=fg
    highlight SignColumn term=NONE cterm=NONE ctermbg=235 ctermfg=148
    highlight SpellCap term=undercurl cterm=undercurl ctermbg=bg ctermfg=63
    highlight SpellRare term=undercurl cterm=undercurl ctermbg=bg ctermfg=231
    highlight SpellLocal term=undercurl cterm=undercurl ctermbg=bg ctermfg=87
endif
