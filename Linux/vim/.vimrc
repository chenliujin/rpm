""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> System Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "Disable VI's compatible mode..
set history=500 "Sets how many lines of history VIM has to remember
set so=7 "Set 7 lines to the curors - when moving vertical..
set cmdheight=2 "The commandbar height
set autoread "Set to auto read when a file is changed from the outside
set laststatus=2 "Always show the statusline
set noincsearch
set nolist

"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c "Format the statusline
set statusline=
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding}, " encoding
set statusline+=%{&fileformat}] " file format
if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()} " vim buddy
endif
set statusline+=%= " right align
set statusline+=%2*0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

set nobackup "Turn backup off, since most stuff is in SVN, git anyway...
set nowritebackup
set noswapfile
set noerrorbells
set novisualbell
set t_vb=

let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

syntax on
filetype plugin on "Enable filetype plugin
filetype indent on "Enable filetype indent
autocmd! bufwritepost .vimrc source % "When vimrc is edited, reload it

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> User Interface 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number "Show line number
set hid "Change buffer - without saving
set wildmenu "Turn on WiLd menu
set ruler "Always show current position

"设置退格键的模式
"set backspace=start 
"set backspace=eol 
"set backspace=indent
set backspace=eol,start,indent "default 

set whichwrap+=<,>,h,l "Bbackspace and cursor keys wrap to
set hlsearch "高亮显示搜索的内容
set incsearch "Make search act like search in modern browsers
set ignorecase "Ignore case when searching
set magic "Set magic on, for regular expressions
set mat=2 "How many tenths of a second to blink
set showmatch "显示匹配的括号([{和}])
set showmode
set esckeys
"set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> TEXT && TAB && INDENT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab "使用空格代替制表符 
set tabstop=4 "设置<Tab>=4个空格
set shiftwidth=4 "縮進長度,用于cindent|<<|>>
set smarttab "行首的 <Tab> 根据 'shiftwidth' 插入空白
set linebreak "不在单词中断行
set textwidth=0
set autoindent "开启新行时，从当前行复制缩进距离
set cindent
set smartindent "开启新行时使用智能自动缩进
set nowrap "no Wrap lines

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> Colors && Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8 "设置编码
set fileencodings=utf-8,ucs-bom,gbk,default,latin1 "设置文件编码
set ffs=unix,dos,mac "Default file types
set helplang=cn "Use chinese help
syntax enable "Enable syntax highlight 
try
    lang en_US
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> Plugin - taglist 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0 
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
let Tlist_WinWidth = 40
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map 0 ^
map <space> /
map <c-space> ?
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>

cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
""""""""""""""""""""""""""""""""""""""""
"----> F1~F10
""""""""""""""""""""""""""""""""""""""""
inoremap <F2><ESC>:call PhpDocSingle()<CR>i
nnoremap <F2> :call PhpDocSingle()<CR>
vnoremap <F2> :call PhpDocRange()<CR>

nnoremap <silent> <F8> :TlistToggle<CR>
map <F10> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mapleader(default \)
" 	With a map leader it's possible to do extra key combinations
" 	like <leader>w(\w) saves the current file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "," 
let g:mapleader = "," 

" Fast edit .vimrc
map <Leader>e :tabnew! ~/.vimrc<CR>

map <Leader>tn :tabnew %<cr>
map <Leader>te :tabedit
map <Leader>tc :tabclose<cr>
map <Leader>tm :tabmove
map <Leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <Leader>ss :setlocal spell!<cr>
map <Leader>sn ]s
map <Leader>sp [s
map <Leader>sa zg
map <Leader>s? z=
map <silent> <Leader><cr> :nohlsearch<cr>

" Fast saving
nmap <Leader>w :w!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MySys()
    if has("unix")
        return "unix"
    elseif has("win32")
        return "win32"
    else 
        return "mac"
    endif
endfunction

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> Unix System Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if MySys() == "unix" 
    set gfn=Monospace\ 10
    set shell=/bin/bash
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> GUI Setting 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set guioptions-=T
    set guifont=Consolas:h9
    set background=dark
    set t_Co=256
    colorscheme peaksea
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> Plugin - supertag 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:SuperTabDefaultCompletionType="context"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> Source
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source ~/.xdiff/xdiff.vim
"source ~/.vim/plugin.vim
"source ~/.vim/vimrc
