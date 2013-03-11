syntax enable
colorscheme default
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set nobackup
"set cindent 
set smartindent
set smarttab
set ai "自动缩进
set hlsearch
set autoindent
set nu
set is                      "incsearch 增强搜索
"set ic                     " ignorecase      "忽略大小写 但是输入中有大写的话不忽略
"set paste                  "防止粘贴的时候位置不正确 vim才有
set smartindent
set background=dark
set ruler
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
set linebreak       " 整词换行
set hidden
set autoread              " read open files again when changed outside Vim
set showcmd                 " 输入的命令显示出来，看的清楚些
"set nowrap                " do not wrap lines
"set cursorline             " 光标线
"
"设置自动补全下拉菜单项目数,7个是有根据的,在牛逼的人脑中最多存7个项目.
if version>=700
        set pumheight=7
endif

"显示括号配对情况。 打开这个选项后， 当输入后括号 (包括小括号、中括号、大括号)
"的时候， 光标会跳回前括号片刻， 然后跳回来， 以此显示括号的配对情况。
set sm


set so=7 "Set 7 lines to the curors - when moving vertical..


"set fdm=syntax
"

"----------------------------------------------------------------------------
" 设置命令行和状态栏

set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set statusline=%F%m%r,%Y,%{&fileformat}" " " ASCII="%b,HEX="%B" " " %l,%c%V" %p%%" " " [" %L" lines" in" all" ]
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
                            " 设置在状态行显示的信息如下：
                            " %F    当前文件名
                            " %m    当前文件修改状态
                            " %r    当前文件是否只读
                            " %Y    当前文件类型
                            " %{&fileformat}
                            "       当前文件编码
                            " %b    当前光标处字符的 ASCII 码值
                            " %B    当前光标处字符的十六进制值
                            " %l    当前光标行号
                            " %c    当前光标列号
                            " %V    当前光标虚拟列号 (根据字符所占字节数计算)
                            " %p    当前行占总行数的百分比
                            " %%    百分号
                            " %L    当前文件总行数
"----------------------------------------------------------------------------

"----------------------------------------------------------------------------
"python 相关
" python auto-complete code
" Typing the following (in insert mode):
"   os.lis<Ctrl-n>
" will expand to:
"   os.listdir(
" Python 自动补全功能，只需要反覆按 Ctrl-N 就行了
 if has("autocmd") 
       autocmd FileType python set complete+=k~/.vim/plugin/pydiction isk+=.,( 
 endif " has("autocmd")
"----------------------------------------------------------------------------
"----------------------------------------------------------------------------
iab     #i          #include <<Esc>mxa><Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     #d          #define
"----------------------------------------------------------------------------
nmap  <silent> <F4>    :set fdm=syntax<CR>
"文件工程分栏
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
nmap wv     <C-w>v     " 垂直分割当前窗口
nmap wc     <C-w>c     " 关闭当前窗口
nmap ws     <C-w>s     " 水平分割当前窗口

"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
"    F2   -  write file without confirmation
"    F3   -  call file explorer Ex
"    F4   -  show tag under curser in the preview window (tagfile must exist!)
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error   
"  S-Tab  -  Fast switching between buffers (see below)
"    C-q  -  Leave the editor with Ctrl-q (see below)
"-------------------------------------------------------------------------------
"
map   <silent> <F1>    :A<CR>
map   <silent> <F2>    :write<CR>
"map   <silent> <F3>    :Explore<CR>
"nmap  <silent> <F4>    :exe ":ptag ".expand("<cword>")<CR>
map   <silent> <F5>    :copen<CR>
map   <silent> <F6>    :cclose<CR>
map   <silent> <F7>    :cp<CR>
map   <silent> <F8>    :cn<CR>
"
imap   <silent> <F1>    :A<CR>
imap  <silent> <F2>    <Esc>:write<CR>
"imap  <silent> <F3>    <Esc>:Explore<CR>
imap  <silent> <F4>    <Esc>:exe ":ptag ".expand("<cword>")<CR>
imap  <silent> <F5>    <Esc>:copen<CR>
imap  <silent> <F6>    <Esc>:cclose<CR>
imap  <silent> <F7>    <Esc>:cp<CR>
imap  <silent> <F8>    <Esc>:cn<CR>
"
"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
"
 map  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly && 
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
imap  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly && 
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q : Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
nmap  <C-q>    :wqa<CR>
"
"
"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
"if has("autocmd")
"  autocmd BufEnter * :lchdir %:p:h
"endif " has("autocmd")
"
"-------------------------------------------------------------------------------
" Filename completion
" 
"   wildmenu : command-line completion operates in an enhanced mode
" wildignore : A file that matches with one of these
"              patterns is ignored when completing file or directory names.
"-------------------------------------------------------------------------------
" 
set wildmenu
set wildignore=*.bak,*.o,*.e,*~
"
"-------------------------------------------------------------------------------
" print options  (pc = percentage of the media size)
"-------------------------------------------------------------------------------
set printoptions=left:8pc,right:3pc

"标签

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 

"全工程grep
nnoremap <silent> <F3> :Grep<CR>

"tab补全
"let g:SuperTabRetainCompletionType=0
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"let g:C_BraceOnNewLine = "yes" 

"auto complete
set nocp
filetype plugin on
filetype indent on

set completeopt=longest,menu
"set completeopt=menu,preview
"set tags+=/usr/include/Qt/tags
"set tags+=/usr/include/QtGui/tags
"set tags+=/usr/include/QtCore/tags
"set tags+=/usr/include/QtDesigner/tags
"set tags+=/usr/include/QtNetwork/tags
"set tags+=/home/cyher/workspace/cyher2410/kernel/linux-2.6.26.3/tags
"set tags+=~/.vim/python/python.tags
"au BufWritePost *.c,*.cpp,*.cc,*.h !~/.vim/cs.sh
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"ARM 汇编高亮
let asmsyntax='armasm'
let filetype_inc='armasm'

"编码识别
let &termencoding=&encoding
set fileencodings=utf8,gbk,ucs-bom,cp936

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


