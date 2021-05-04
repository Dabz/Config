set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'aperezdc/vim-template'
Plugin 'godlygeek/tabular'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'shime/vim-livedown'
Plugin 'ajmwagar/vim-deus'
Plugin 'jnurmine/Zenburn'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vmchale/tomlcheck-vim'
Plugin 'hashivim/vim-terraform.git'
Plugin 'rhysd/vim-grammarous'
Plugin 'Townk/vim-autoclose'
Plugin 'mbbill/undotree'
Plugin 'vim-scripts/DoxygenToolkit.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" theme configuration
syntax on
silent! color deus
let g:airline_theme = "zenburn"

" YCM configuration
let g:ycm_cache_omnifunc = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_error_symbol = '!>'
let g:go_fmt_autosave = 0
let g:AutoClosePreserveDotReg = 0
inoremap (<CR> (<Esc>o)<Esc>O

" NERDTree configuration
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Doxygen configuration
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag =    "@returns "
let g:DoxygenToolkit_blockHeader =  ""
let g:DoxygenToolkit_blockFooter =  ""
let g:DoxygenToolkit_authorName =   $FULLNAME
let g:DoxygenToolkit_licenseTag =   "MIT"
let g:DoxygenToolkit_interCommentTag = "** "
let g:email = $MAIL

" Syntax configuration
set relativenumber
set expandtab
set tabstop=2
set softtabstop=2
set nojoinspaces
set shiftwidth=2

" Vim Terraform configuration
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" Highlight trailing whitespace
set list
set listchars=tab:\ \ ,trail:*
