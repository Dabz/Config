"#############################################################################
"
"       Filename:  epita.vim
"
"    Description:  Epita coding style.
"
"   GVIM Version:  7.0+
"
"         Author:  Gasparina Damien
"          Email:  gaspar_d@epita.fr
"
"        Version:  see variable  g:EPIC_Version  below
"        Created:  03.07.2010
"
"-----------------------------------------------------------------------------

if v:version < 703
  echohl WarningMsg
  echom 'The plugin epita.vim needs Vim version >= 7.3'
  echohl None
  finish
endif

" Prevent duplicate loading     {{{1
"
let g:EPIC_Version= "0.2"


" Environement                   {{{1
if exists("$FULLNAME")
  let mename = $FULLNAME
else
  let mename = $USER
endif

let melogin = $USER

if exists("$EMAIL")
  let memail = $EMAIL
else
  " FIXME
  let memail = $USER . "@epita.fr"
endif

if exists("$NO_STRICT_EPITA_HEADERS")
  let meloginstring = "Mail"
else
  let meloginstring = "Login"
endif


" Headers               {{{1
au BufNewFile *.c silent call C_New()
au BufNewFile *.h silent call H_New()
au BufNewFile *.hh silent call HH_New()
au BufNewFile *.hxx silent call CPP_New()
au BufNewFile *.cc silent call CPP_New()
au BufNewFile *.cpp silent call CPP_New()
au BufNewFile *.go silent call C_New()
au BufNewFile *.tpl silent call CPP_New()

au BufNewFile *.ml silent call ML_New()
au BufWritePost *.ml silent call ML_Write()

au BufWritePre *.c silent call C_Write()
au BufWritePre *.h silent call C_Write()
au BufWritePre *.cc silent call C_Write()
au BufWritePre *.hxx silent call C_Write()
au BufWritePre *.cpp silent call C_Write()
au BufWritePre *.tpl silent call C_Write()
au BufWritePre *.go silent call C_Write()

au BufRead *.c silent call C_Read()
au BufRead *.h silent call C_Read()
au BufRead *.hh silent call CPP_Read()
au BufRead *.cc silent call CPP_Read()
au BufRead *.hxx silent call CPP_Read()
au BufRead *.cpp silent call CPP_Read()
au BufRead *.tpl silent call CPP_Read()
au BufRead *.go silent call C_Read()

function Check_C()
  call CheckFile('{', '}', 40, '/*', '**','*/', '//', 80)
endfun

function C_New()
  0r ~/.vim/template/epita_header.tpl
  let tmp = expand("%:t")
  execute "% s,@PROJECT@," . substitute(tmp, "\\.[^\\.]$", "",  "")
  call ReplaceFields('/*', '**', '*/')
  exec 11
  normal dG
  call HiWhiteSpace()
endfun

function CPP_New()
  0r ~/.vim/template/epita_header.tpl
  let tmp = expand("%:t")
  execute "% s,@PROJECT@," . substitute(tmp, "\\.[^\\.]$", "",  "")
  call ReplaceFields('/*', ' *', ' */')
  exec 11
  normal dG
  call HiWhiteSpace()
endfun

function H_New()
  0r ~/.vim/template/h.tpl
  0r ~/.vim/template/epita_header.tpl
  call ReplaceFields('/*', '**', ' */')
  let tmp = expand("%:t")
  execute "% s,@PROJECT@," . substitute(tmp, "\\.[^\\.]$", "",  "")
  let tmp = toupper(tmp)
  let tmp = substitute(tmp, "\\.", "_", "ge") . '_'
  exec 16
  normal dG
  execute "% s,@DEFINE@," . tmp . ",ge"
  call HiWhiteSpace()
  call HiOverLengthh()
endfun

function HH_New()
  0r ~/.vim/template/h.tpl
  0r ~/.vim/template/epita_header.tpl
  call ReplaceFields('/*', ' *', ' */')
  let tmp = expand("%:t")
  execute "% s,@PROJECT@," . substitute(tmp, "\\.[^\\.]$", "",  "")
  let tmp = toupper(tmp)
  let tmp = substitute(tmp, "\\.", "_", "ge") . '_'
  exec 16
  normal dG
  execute "% s,@DEFINE@," . tmp . ",ge"
  call HiWhiteSpace()
  call CPPHiOverLengthh()
endfun

function ML_New()
  0r ~/.vim/template/epita_header.tpl
  call ReplaceFields('(*', '**', '*)')
  call HiWhiteSpace()
  call HiOverLengthh()
endfun

function C_Read()
  call HiWhiteSpace()
  map <F10> :call CheckFile('{', '}', 41, '/*', '**','*/', '//', 80) <CR>
  call HiOverLengthh()
endfun

function CPP_Read()
  map <F10> :call CheckFile('{', '}', 41, '/*', '**','*/', '//', 80) <CR>
  if exists("$EPITA_STRICT")
    call HiWhiteSpace()
    call CPPHiOverLengthh()
  endif
endfun

function ML_Read()
  call HiWhiteSpace()
  call HiOverLengthh()
endfun

function C_Write()
  normal mS
  execute "1,8 s,\\(Last update \\).*,\\1" . strftime("%c") . " " . g:mename . ",e"

  normal `S
endfun

function ML_Write()
  normal mS
  execute "1,8 s,\\(Last update \\).*,\\1" . strftime("%c") . " " . g:mename . ",e"
  normal `S
endfun



" Comments                      {{{1
autocmd FileType c set comments=sr:/*,mb:**,ex:*/ "EPITA coding style

" Aligns                        {{{2

" Hightlights                   {{{1
"  Extra White space            {{{2
function HiWhiteSpace()
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+\%#\@<!$/
endfun

"  80 lines                     {{{2
function HiOverLengthh()
  set cc=+1
  hi ColorColumn ctermbg=darkgrey guibg=darkgrey
endfun

"  Parentheses                     {{{2
function CPPHiOverLengthh()
  " highlight MultipleSpaces ctermbg=darkred ctermfg=white guibg=#ADAADA
  highlight OverLength ctermbg=darkgreen ctermfg=white guibg=#ADAADA
  highlight BadParenthesis ctermbg=darkblue ctermfg=white guibg=#ADAADA
  highlight BadDoubleSpace ctermbg=darkgreen ctermfg=white guibg=#ADAADA
  highlight BadStars ctermbg=darkblue ctermfg=white guibg=#ADAADA
  highlight BadBracket ctermbg=blue ctermfg=white guibg=#ADAADA

  highlight BadtemplateLeft ctermbg=darkgreen ctermfg=white guibg=#ADAADA
  highlight BadtemplateRight ctermbg=darkgreen ctermfg=white guibg=#ADAADA
  highlight BadtemplateRightCompose ctermbg=darkgreen ctermfg=white guibg=#ADAADA

  highlight BadClassName ctermbg=darkgreen ctermfg=white guibg=#ADAADA
  highlight BadTypedef ctermbg=darkgrey ctermfg=white guibg=#ADAADA

  set cc=+1
  hi ColorColumn ctermbg=darkgrey guibg=darkgrey

  call matchadd('OverLength', '\%80v.*')

  " call matchadd('MultipleSpaces', '\S\s\s\s*')

  call matchadd('BadDoubleSpace', '^\s*typedef\s\+\(.*_type;$\)\@!')
  call matchadd('BadStars', '^\s*\w\w*\s\s*\*\w')
  call matchadd('BadParenthesis', '\([^ \t&!()](\)\&\(\(\s\+(\)\@!\)')
  call matchadd('BadDoubleSpace', '\s\s\s*[()]\&\(\s\+[()]\)\@!')
  call matchadd('BadBracket', '\([^ \t]\s*[\{}]\)\|\([{}]\s*\a\)')

  call matchadd('BadtemplateLeft', 'template.*<\s\s*.*>')
  call matchadd('BadtemplateRight', 'template.*<.*[^>]\s\s*>')
  call matchadd('BadtemplateRightCompose', 'template.*[^\s]>>')

  call matchadd('BadClassName', 'class \(\U\|[^\s]*_[^\s]*\)') "Starting with uppercase or containing '_'
endfun

" Trailing spaces               {{{1
function TrimWhiteSpace()
  let curr = line('.')
  %s/\s*$//ge
  exec curr
endfun

autocmd BufWrite * :call TrimWhiteSpace()

" Files checking                {{{1

" Tools                         {{{2

" Print error                   {{{3
function Print_err(msg)
  if s:nb_err == 0
    let s:cur_buff = bufnr('%')
    if !bufexists('err')
      new err
      setlocal buftype=nofile
      setlocal syntax=none
      setlocal noswapfile
      setlocal bufhidden=delete
      setlocal tabstop=8
    else
      execute bufwinnr('err').'wincmd w'
      0
      normal dG
      execute bufwinnr(s:cur_buff).'wincmd w'
    endif
  endif
  let s:nb_err += 1
  execute bufwinnr('err').'wincmd w'
  0put!= (s:pos - 1).': '.a:msg
  execute bufwinnr(s:cur_buff).'wincmd w'
endfun


" Get line                      {{{3
function GetNewLine()
  if !exists('s:pos')
    let s:pos = 0
  endif
  let ln =  getline(s:pos)
  let s:pos += 1
  call HandlePar(s:open_bracket, s:close_bracket, ln)
  return ln
endfun


" Get paragraphs number         {{{3
function GetNbPar()
  if exists('s:nb_par')
    return s:nb_par
  endif
endfun


" Actualize paragraph number    {{{3
function HandlePar(open_bracket, close_bracket, ln)
  if !exists("s:nb_par")
    let s:nb_par = 0
  endif
  if match(a:ln, '\s\+'.a:open_bracket.'\|^'.a:open_bracket.'$') != -1
    let s:nb_par += 1
  elseif match(a:ln, '\s\+'.a:close_bracket.'\|^'.a:close_bracket.'$') != -1
    let s:nb_par -= 1
  elseif exists(s:a_indent_error) && s:a_indent_error
    let begin = match(a:ln, '[^ ]')
    if begin != -1 && begin != (&shiftwidth * s:nb_par)
      call Print_err('Indentation error')
    endif
  endif
endfun

" Check Overlength              {{{2

function CheckOverlength(ln, open_pos, close_pos, limit, is_fun)
  if !exists('s:open_function')
    let s:open_function = -1
  endif
  if a:is_fun != -1
    let s:open_function  = s:pos
  endif
  if a:open_pos != -1
    let s:nb = s:nb + 1
  elseif a:close_pos != -1
    let s:nb = s:nb - 1
    if !s:nb && s:open_function != -1
      if s:nb_line > a:limit
        call Print_err('Function overlength.')
      endif
      let s:open_function = -1
    endif
  endif

  if s:nb == 0
    let s:nb_line = 0
  else
    let s:nb_line = s:nb_line + 1
  endif
endfun

" Check indent                  {{{2

function CheckIndent(ln, open_pos, close_pos, is_fun, is_var)
  if (a:open_pos != -1 ) && a:open_pos != (s:nb - 1) * &shiftwidth
    call Print_err('Indentation error with opening bracket.')
  endif
  if (a:close_pos != -1 ) && a:close_pos != s:nb * &shiftwidth
    call Print_err('Indentation error with closing bracket.')
  endif

  if a:is_fun != -1
    let s:v_indent = match(a:ln, '[a-zA-Z\-_]\+\s*(.*)$')
  elseif a:is_var != -1
    if !exists('s:v_indent')
      let s:v_indent = a:is_var
    elseif a:is_var != s:v_indent
      call Print_err('Variable not aligned.')
    endif
  endif
endfun

" Check comments                {{{2

function CheckComments(ln, c_open, c_mid, c_close, c_line)
  if !exists('s:clast_pos')
    let s:clast_pos = -1
  endif
  let cpos = match(a:ln, '\M'.a:c_open.'\|'.a:c_mid.'\|'.a:c_close.'\|'.a:c_line)
  if (s:clast_pos != -1 && cpos != -1 && cpos != s:clast_pos)
    call Print_err("Comments not aligned correctly")
    let cpos = s:clast_pos
  endif
  let s:clast_pos = cpos
  let ln = substitute(a:ln, '\M'.a:c_open.'\|'.a:c_mid.'\|'.a:c_close.'\|'.a:c_line, '', '')
  return ln
endfun

" Max character                 {{{2
function CheckMaxChar(ln, max_char)
  if len(a:ln) >= a:max_char
    call Print_err( "Line too long.")
  endif
endfun

" Handle Data Type              {{{2

" Handle Structure              {{{3
function HandleStructure(ln)
  if match(a:ln, 'struct\s\+s_') == -1
    call Print_err("Structure's name must begin by s_")
  endif
  let structure_indent = match(a:ln, '[a-zA-Z0-9_\-]\+\s*$')
  let ln = GetNewLine()
  let nb_par = GetNbPar()
  let close_nb_par = nb_par
  while nb_par >= close_nb_par
    let ln = GetNewLine()
    let nb_par = GetNbPar()
    let variable = match(ln, '[a-zA-Z0-9_\-]\+\s*;$')
    if variable != -1 && variable != structure_indent
      call Print_err('Variable must be alined with the title in a structure')
    endif
  endwhile
endfun

" Handle Enumeration            {{{3
function HandleEnumeration(ln)
  if match(a:ln, 'enum\s\+e_') == -1
    call Print_err("Enumeration's name must begin by e_")
  endif
  let enum_indent = match(a:ln, '[a-zA-Z0-9_\-]\+\s*$')
  let ln = GetNewLine()
  let nb_par = GetNbPar()
  let close_nb_par = nb_par
  let s:a_indent_error = 0      " Desactivate indentation error notification
  while nb_par >= close_nb_par
    let ln = GetNewLine()
    let nb_par = GetNbPar()
    let variable = match(ln, '[a-zA-Z_\-][a-zA-Z0-9_\-]*\s*,*\s*$')
    if variable != -1 && variable != enum_indent
      call Print_err('Variable must be alined with the title in an enumeration')
    endif
  endwhile
  let s:a_indent_error = 1

endfun

" Handle Data type              {{{3
function HandleDataType(ln)
  let ln = a:ln
  if match(a:ln, '^\s*struct\s\+[a-zA-Z_\-][a-zA-Z0-9_\- ]*$\|^\s*union\s\+[a-zA-Z_\-][a-zA-Z0-9_\- ]*$') != -1       " Structure
    call HandleStructure(ln)
  elseif match(ln, '^\s*enum\s\+[a-zA-Z_\-][a-zA-Z0-9_\- ]*\s*$') != -1                                          " Enumeration
    call HandleEnumeration(ln)
  elseif match(ln, '^\s*typedef\s\+[a-zA-Z0-9_\-\s]\+\s\+[a-zA-Z0-9_\-\s]\+') != -1
    "TODO Handle Typedef
  else
    return 0
  endif
  return 1
endfun

" Handle function               {{{2

" Handle Variable / Constante   {{{3

function HandleVariable(correct_indent, ln)
  let match_non_initialized = match(a:ln, '^\s*[a-zA-Z_\-][a-zA-Z0-9_\- ]*\s\+[a-zA-Z_\-][a-zA-Z0-9_\- ]*;$')
  if match_non_initialized != -1
    let indent = match(a:ln, '[a-zA-Z0-9_\-]\+;$')
    if indent != a:correct_indent
      call Print_err('Variable not correctly aligned')
    endif
  else
    let match_initialized = match(a:ln, '^\s*[a-zA-Z_\-][a-zA-Z0-9_\- ]*\s\+[a-zA-Z_\-][a-zA-Z0-9_\- ]*\s*=')
    if match_initialized != -1
      let indent = match(a:ln, '[a-zA-Z0-9_\-]\+\s*=')
      if indent != a:correct_indent
        call Print_err('Variable not correctly aligned')
      endif
    endif
  endif
endfun

function HandleReturn(ln)
  if match(a:ln, '^\s*return\s\+.*$') != -1
    call Print_err('Bad syntax for return keyword')
  endif
endfun


function HandleFunction(open_bracket, close_bracket,  ln)
  if match(a:ln, '^\s*[a-zA-Z_\-][a-zA-Z0-9_\- ]*\s\+[a-zA-Z_\-][a-zA-Z0-9_\- ]*\s*(.*)') != -1
    let indent_variable = match(a:ln, '[a-zA-Z0-9_\-]\+\s*(')
    if (indent_variable + 1) % 8 != 0
      call Print_err('Name of a function must begin at modulo 8')
    endif
    let ln = GetNewLine()
    " TODO Check bracket
    let nb_par = GetNbPar()
    let close_nb_par = nb_par
    while nb_par >= close_nb_par
      let ln = GetNewLine()
      let nb_par = GetNbPar()
      call HandleVariable(indent_variable, ln)
      call HandleReturn(ln)
    endwhile
    return 1
  else
    return 0
  endif
endfun

" Main function                 {{{2
function CheckFile(open, close, function_overlength, c_open, c_mid, c_close, c_line, max_char)
  let s:open_bracket = a:open
  let s:close_bracket = a:close
  let s:a_indent_error = 1
  let s:pos = 0
  let end = line ("$")

  let s:nb = 0
  let s:nb_line = 0
  let s:nb_err = 0

  echohl WarningMsg

  while (s:pos <= end)
    let ln = GetNewLine()
    call CheckMaxChar(ln, a:max_char)
    let ln_no_comments = CheckComments(ln, a:c_open, a:c_mid, a:c_close, a:c_line)

    if ! HandleDataType(ln_no_comments)
      if ! HandleFunction(a:open, a:close, ln_no_comments)
        "call HandlePrototype(ln_no_comments)
      endif
    endif
  endwhile

  if s:nb_err
    echoerr s:nb_err . " coding style's errors detected."
    execute bufwinnr('err').'wincmd w'
    execute 'resize '. min([10,s:nb_err])
    execute bufwinnr(s:cur_buff).'wincmd w'
  elseif bufexists('err')
    execute bufwinnr(s:cur_buff).'wincmd q'
  endif

  echohl None
endfun
