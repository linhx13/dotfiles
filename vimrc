set autoread
set number
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LINES=%L]
set statusline=%F%m%r%h%w%<\ [FORMAT=%{&ff}]\ [POS=%04l,%04v][%p%%,%L]\ %=[%{strftime('%H:%M')}]
"set statusline=%F%m%r%h%w%<\ %{&ff}\ %Y\ [0x\%02.2B]\ %=%l/%L,%v\ %p%%

set t_Co=256

set mouse=

set ruler
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

set tabstop=4   " tab width is 4 spaces
set shiftwidth=4    " for auto indent
set expandtab
"set foldmethod=indent

set autoindent
set cindent 
set smartindent

set hlsearch
set showmatch
set cursorline
"set cursorcolumn
"hi CursorLine term=bold cterm=bold guibg=Grey40
"hi CursorLine   term=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
hi CursorLine   cterm=NONE ctermbg=LightBlue ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=LightBlue ctermfg=white guibg=darkred guifg=white
filetype on
filetype plugin on
filetype indent on

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,sjis,euc-kr,latin1
set termencoding=utf-8

set complete=.,w,b,u,t,i

syntax on

"set list

set backspace=indent,eol,start

filetype on

set background=dark

"colorscheme torte
colorscheme desert
"colorscheme darkblue
"colorscheme solarized
"colorscheme zenburn

" configure tags
map <C-g> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set tags+=~/.vim/tags/sys_include

let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

set nocompatible

" protobuf file configuration
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

"新建.c,.h,.sh,.java文件，自动插入文件头 
"""定义函数SetTitle，自动插入文件头
let g:author_str = "linhx@ifchange.com"

autocmd BufNewFile *.cpp,*.hpp,*.[ch],*.sh,*.py exec ":call SetTitle()"
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh'
        call setline(1, "\#! /bin/sh")
        call append(line(".")+0, "\# Author: " . g:author_str)
        call append(line(".")+1, "\#")
        call append(line(".")+2, "\#")
        call append(line(".")+3, "") 
    elseif &filetype == "python"
        call setline(1, "\# -*- coding: utf-8 -*-")
        call append(line(".")+0, "\"\"\"")
        call append(line(".")+1, "")
        call append(line(".")+2, "Author: " . g:author_str)
        call append(line(".")+3, "\"\"\"")
    else
        call append(line(".")+0, "\/\/ Author: " . g:author_str)
        call append(line(".")+1, "\/\/ Brief:  ")
        call append(line(".")+2, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
