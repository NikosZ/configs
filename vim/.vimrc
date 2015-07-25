set nocompatible
"General
set backspace=indent,eol,start
set ruler
set showcmd
set incsearch
set hlsearch

syntax on

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-easytags'
Plugin 'ervandew/supertab'
Plugin 'vim-latex/vim-latex'
"Plugin 'godlygeek/csapprox'
"Plugin 'scrooloose/syntastic'
call vundle#end()  
filetype plugin indent on

"solarized
set background=dark
"let g:solarized_termcolors=256
"airline
"set t_Co=256
colorscheme solarized
set laststatus=2
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enable =1
let g:airline_powerline_fonts=1
"easytags
set tags=./tags
let g:easytags_events= ['BufReadPost','BufWritePost']
let g:easytags_async =1
let g:easytags_dynamic_files=2
let g:easytags_resolve_links =1
let g:easytags_suppress_ctags_warning =1
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
set tags+=~/.vim/tags/cpp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest,preview
au BufRead,BufNewFile *.ml,*.mli compiler ocaml
"syntaxic
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"Merlin
set rtp+=/usr/local/share/ocamlmerlin/vim
set rtp+=/usr/local/share/ocamlmerlin/vimbufsync
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
"Some compiler settings
autocmd filetype cpp nnoremap <F4> :!g++ % -ggdb -o %:r <CR>
autocmd filetype cpp nnoremap<F5> :!g++ % -ggdb -o %:r && ./%:r <CR>
