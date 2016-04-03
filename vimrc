set runtimepath=$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/,~/.vim/after
execute pathogen#infect()

colorscheme solarized
let g:solarized_degrade=1


" cgiset nocompatible
" Apparence

set sj=-50
set number
set hidden
set laststatus=2
set fillchars=stl:=,stlnc:-,vert:\|,fold:-,diff:-
set sb
set spr
set showcmd
set pumheight=5
set wildmenu
set wildignore+=*.o,*.cmi,*.cmo

" Input
set backspace=2
set mouse=nv


" Indentation, text formatting
set cindent smartindent
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,ps,t0,+s,(0,u0,)20,*30,g0
set noexpandtab "tab = space
set shiftwidth=2
set tabstop=8
" set smarttab
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
autocmd FileType * set formatoptions-=o "do not comment with the key 'o'
"set textwidth=79
set swapsync=
set foldmethod=marker

map <silent> <Leader>z :%s/\s\+$//<CR>
"au Filetype c match OverLength /\%81v.*/

" Autocommand, map

autocmd BufNewFile,BufRead *.h set filetype=c
autocmd BufNewFile,BufRead *.hxx set filetype=cpp
autocmd BufNewFile,BufRead *.tpp set filetype=cpp
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en
autocmd BufNewFile,BufRead *.article setlocal spell spelllang=en
autocmd BufRead,BufNewFile *.ml,*.mli set filetype=omlet
autocmd BufRead,BufNewFile *.asm set filetype=asm68k
autocmd BufRead,BufNewFile *.aasm set filetype=asm

" Plugin option

"omlet
let omlet_indent = 2 "Different indent for ocaml source

"C option
let c_space_errors = 1
let c_syntax_for_h = 1
let c_no_names = 1
let c_C94 = 1
let c_C99 = 1
"let c_C99_warn = 0
"let c_cpp_warn = 1
let c_warn_8bitchars = 1
let c_warn_multichar = 1
let c_warn_digraph = 1
let c_warn_trigraph = 1
let c_no_octal = 1

" Keys
"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>

" Functions

function s:Rot()
    exec "normal "."ggVGg?"
endfunction
command -nargs=0 Rot13 :call s:Rot()


" set list listchars=trail:.,extends:>

"Doxygen
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag =    "@returns "
let g:DoxygenToolkit_blockHeader = ""
let g:DoxygenToolkit_blockFooter = ""
let g:DoxygenToolkit_authorName =   "Damien Gasparina"
let g:DoxygenToolkit_licenseTag =   "BSD"
let g:DoxygenToolkit_interCommentTag = "** "


" C_Suport option
let g:C_CCompiler	= "gcc"
let g:C_CplusCompiler	= "g++"



" set tags+=~/.vim/tags/boost		" Boost library is too huge to be use
					" with ctags

" configure fswitch
au! BufEnter *.cpp let b:fswitchdst = 'hh,h' | let b:fswitchlocs = '../inc'
au! BufEnter *.cc let b:fswitchdst = 'hh,h' | let b:fswitchlocs = '../inc'
au! BufEnter *.hxx let b:fswitchdst = 'hh,h' | let b:fswitchlocs = '../inc'
au! BufEnter *.hh let b:fswitchdst = 'hh,h' | let b:fswitchlocs = '../inc'

let g:protodefprotogetter = "~/.vim/pullproto.pl"

let g:alternateExtensions_CPP = "hxx"

" Fold
set foldmethod=syntax

" Code
syntax on
filetype plugin on
filetype plugin indent on

:set expandtab
:set tabstop=2


let g:go_fmt_autosave = 0
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
let g:airline#extensions#tabline#enabled = 1
imap <C-l> <esc>a<Plug>snipMateNextOrTrigger
smap <C-l> <esc>a<Plug>snipMateNextOrTrigger
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set relativenumber

let g:ycm_cache_omnifunc = 1
let g:ycm_confirm_extra_conf = 1
