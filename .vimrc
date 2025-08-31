" My Vimrc File

call plug#begin()

    " List of Plugins
    Plug 'tpope/vim-sensible'
    Plug 'preservim/nerdtree'
    Plug 'nordtheme/vim'
    Plug 'vim-airline/vim-airline'

call plug#end()

" Start NERDTree-----------------------------------------
autocmd VimEnter * NERDTree | vertical resize 15 | wincmd p 

" Remove Help Line at top
let NERDTreeMinimalUI=1

" Exit NERDTree only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
"-----------------------------------------------------------
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
"set termguicolors
colorscheme nord


" Basics
syntax on
filetype off
set nocompatible
set cursorline
set tabstop=4
set shiftwidth=4
set scrolloff=10
set expandtab
set cursorline
set mouse=a
set number
set relativenumber
set incsearch
set nohlsearch
set wildmenu
set wildmode=longest,list,full
set history=1000

noremap WW :w<CR>

set splitbelow
autocmd VimEnter * terminal 
autocmd VimEnter * resize 5 | wincmd p
autocmd QuitPre * if winnr('$') > 1 | qall! | endif

" RTL Stuff
au Filetype vhdl setl sw=2 sts=2 ts=2 et
au Filetype verilog setl sw=2 sts=2 ts=2 et
au Filetype systemverilog setl sw=2 sts=2 ts=2 et
autocmd BufEnter *.vhdl,*.vhd set ignorecase
autocmd BufEnter *.svh,*.sv set filetype=systemverilog
autocmd BufEnter *.vh set filetype=verilog
autocmd BufEnter *.xdc set filetype=tcl
"Set file format of vhdl/verilog/systemverilog files to unix
autocmd BufWrite *.vhdl,*.vhd set ff=unix
autocmd BufWrite *.v,*sv,*.svh set ff=unix
"See indent.txt
let g:vhdl_indent_genportmap = 0
function! Filecleanup()
"Remove ^M from end of lines
%s/^M$//ge
"Remove Trailing Spaces
%s/\s\+$//ge
"Remove Tabs
retab
endfunction 
