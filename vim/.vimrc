vim9script
autocmd!
set shellslash

# - - - - -
# dein
# - - - - -

var dein_dir = expand('~/.local/share/vim/dein')
var dein_repo_dir = dein_dir .. '/repos/github.com/Shougo/dein.vim'
if !isdirectory(dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' dein_repo_dir
endif
if &runtimepath !~# '/dein.vim'
  execute 'set runtimepath^=' .. fnamemodify(dein_repo_dir, ':p:gs?\\?/?')
endif

if has('win32')
  var dein_toml_dir = expand('~/vimfiles/')
else
  var dein_toml_dir = expand('~/.vim/')
endif
dein_toml_dir = fnamemodify(dein_toml_dir, ':gs?\\?/?')
var dein_toml = dein_toml_dir .. '/dein.toml'

call dein#begin(dein_dir)
call dein#load_toml(dein_toml)
call dein#end()

if dein#check_install()
  call dein#install()
endif


# - - - - -
# option
# - - - - -

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,sjis,euc-jp,cp932,default
lang en_US.UTF-8

#set term=xterm

set guioptions-=m
set guioptions-=T

filetype plugin indent on
syntax enable

set termguicolors
#colorscheme evening
colorscheme torte
#highlight Cursor cterm=reverse gui=reverse
set cursorline
#highlight clear CursorLine
highlight CursorLine term=underline ctermfg=NONE ctermbg=NONE
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
highlight CursorLine gui=underline guifg=NONE guibg=NONE
&t_SI = "\e[5 q"    # 挿入モード開始                -> バー点滅
&t_SR = "\e[3 q"    # 置換モードの開始              -> 下線点滅
&t_EI = "\e[1 q"    # 挿入または置換モード終了      -> ブロック点滅
&t_ti ..= "\e[1 q"  # 端末を "termcap" モードにする -> ブロック点滅
&t_te ..= "\e[0 q"  # "termcap" モードの終了        -> デフォルト (端末に依存するが、通常はブロック点滅)
#set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-iCursor,r-cr-o:hor20
#set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:hor25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set laststatus=2
set listchars=tab:>_,trail:_
set list
set autoindent
#set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set number
set wildmenu
set wildmode=full
set hlsearch
set shortmess-=S
set clipboard&
set matchpairs+=<:>,（:）,「:」,『:』,＜:＞,【:】,［:］


# - - - - -
# keymap
# - - - - -

nnoremap j gj
nnoremap k gk
nnoremap <silent> <F2> :wa<CR>
nnoremap <silent> <F3> :bprev<CR>
nnoremap <silent> <F4> :bnext<CR>
nnoremap <F5> gT
nnoremap <F6> gt
nnoremap x "_x
nnoremap X "_X
nnoremap Y y$
nnoremap <A-j> :move .+1<CR>==
xnoremap <A-j> :move '>+1<CR>gv=gv
nnoremap <A-k> :move .-2<CR>==
xnoremap <A-k> :move '<-2<CR>gv=gv
nnoremap <silent> <F11> :tabnew<SPACE>$MYVIMRC<CR>
nnoremap <silent> <F12> :wa<Bar>:source<SPACE>$MYVIMRC<CR>


# - - - - -
# autocmd
# - - - - -

augroup texCmd
    autocmd!
    autocmd BufRead main.tex call OpenSrcTexFiles()
augroup END

def OpenSrcTexFiles()
    var src_files = globpath(expand('%:h') .. '/src', '*.tex', true, true)
    for file in src_files
        execute 'tabedit ' .. fnameescape(file)
        setlocal filetype=tex
    endfor
enddef

