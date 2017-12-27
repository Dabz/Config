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
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'aperezdc/vim-template'
Plugin 'godlygeek/tabular'
Plugin 'ajmwagar/vim-deus'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

" theme configuration
syntax on
silent! color deus
set relativenumber
set expandtab
set tabstop=2
let g:airline_theme = "deus"

" YCM configuration
let g:ycm_cache_omnifunc = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_error_symbol = '!>'
let g:go_fmt_autosave = 0

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
