"  _____     ______     __    __     ______     __   __
" /\  __-.  /\  __ \   /\ '-./  \   /\  __ \   /\ '-.\ \
" \ \ \/\ \ \ \  __ \  \ \ \-./\ \  \ \ \/\ \  \ \ \-.  \
"  \ \____-  \ \_\ \_\  \ \_\ \ \_\  \ \_____\  \ \_\\'\_\
"   \/____/   \/_/\/_/   \/_/  \/_/   \/_____/   \/_/ \/_/
"
" Author: Damon Ma
" Repo: https://github.com/blurm/myconfigs

" Plugin definations ------------------------------------------------------- {{{

    " Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
    call plug#begin('~/.vim/plugged')

    " Developing tools

    " Autocomplete & Snips
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi', {'for': 'python'} " autocomplete for Python
    Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'} " autocomplete for Java
    Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] } " autocomplete for Javascript
    Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Navigation & Searching
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'jistr/vim-nerdtree-tabs'

    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neomru.vim' " file_mru for Denite
    Plug 'Shougo/unite.vim'

    " Syntax & hightlight & format
    Plug 'Shutnik/jshint2.vim' " Javascript
    Plug 'python-rope/ropevim' " Python

    " Utils
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdcommenter'
    Plug 'majutsushi/tagbar'
    Plug 'sjl/gundo.vim'  " Visualize your Vim undo tree.
    Plug 'Yggdroot/indentLine'
    Plug 'xolox/vim-misc' "vim-session need to use
    Plug 'xolox/vim-session'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'easymotion/vim-easymotion'
    Plug 'godlygeek/tabular'       " For text filtering and alignment

    " Git Related
    Plug 'tpope/vim-fugitive'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'

    " Color scheme & layout. Warning: devicons must be loaded last
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'

    " to be test
    Plug 'morhetz/gruvbox'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-unimpaired'
    Plug 'junegunn/gv.vim', { 'for': 'gv' } " A git commit browser
    Plug 'terryma/vim-multiple-cursors'
    Plug 'w0rp/ale' "Asynchronous syntax checker
    Plug 'itchyny/vim-cursorword' " Underlines the word under the cursor
    Plug 'elzr/vim-json', { 'for': 'json' } " JSON formatter
    Plug 'Chiel92/vim-autoformat' " Format framework
    Plug 't9md/vim-choosewin'
    Plug 'PotatoesMaster/i3-vim-syntax' " Highlighting for i3wm config
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'thinca/vim-quickrun'
    Plug 'ap/vim-css-color'
    Plug 'Shougo/echodoc.vim'
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " Distraction free writing in vim



    " Useless Plugins
    "Plug 'Shougo/vimfiler.vim'
    "ap/vim-css-colorPlug 'ctrlpvim/ctrlp.vim' " replace kien/ctrlp.vim. this
    "works better with devicons
    "Plug 'scrooloose/syntastic'  " Syntax check framework
    " making a column of increasing or decreasing numbers, dates, or daynames.
    "Plug 'vim-scripts/VisIncr'
    "Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
    "Plug 'klen/python-mode'
    "Plug 'ConradIrwin/vim-bracketed-paste'
    "Plug 'Raimondi/delimitMate'
    "Plug 'ervandew/supertab'
    " Collection of awesome color schemes for Vim
    "Plug 'rafi/awesome-vim-colorschemes'
    "Plug 'MattesGroeger/vim-bookmarks'
    "Plug 'Shougo/junkfile.vim' " Create temporary file for testing or memo

    call plug#end()


    " Need asign this first before being used
    let mapleader=","
" }}}

" Plugin Settings ----------------------------------------------------------{{{
" Goyo {
nnoremap <leader>gy :Goyo<CR>
" }
" junkfile {
    nnoremap <leader>jf :JunkfileOpen<CR>
" }
" vim-choosewin {
nmap - <Plug>(choosewin)
"let g:choosewin_overlay_enable = 1
" }
 "vim-Plug {
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>
" }
" vim-quickrun {
nnoremap <leader>r :QuickRun<CR>
" }
"   ale {
let g:ale_linters = {
            \ 'sh' : ['shellcheck'],
            \ 'vim' : ['vint'],
            \ 'html' : ['tidy'],
            \ 'python' : ['flake8'],
            \ 'markdown' : ['mdl'],
            \ 'javascript' : ['eslint'],
            \}
highlight ALEErrorSign guifg=#fb4934 guibg=#3c3836
highlight ALEWarningSign guifg=#fe8019 guibg=#3c3836
let g:ale_enabled = 1
let g:ale_set_highlights = 1
let g:ale_sign_column_always = 0
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'

" For a more fancy ale statusline
function! ALEGetError()
    let l:res = ale#statusline#Status()
    if l:res ==# 'OK'
        return ''
    else
        let l:e_w = split(l:res)
        if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
            return ' •' . matchstr(l:e_w[0], '\d\+') .' '
        endif
    endif
endfunction

function! ALEGetWarning()
    let l:res = ale#statusline#Status()
    if l:res ==# 'OK'
        return ''
    else
        let l:e_w = split(l:res)
        if len(l:e_w) == 2
            return ' •' . matchstr(l:e_w[1], '\d\+')
        elseif match(l:e_w, 'W') > -1
            return ' •' . matchstr(l:e_w[0], '\d\+')
        endif
    endif
endfunction
"   }

"   autoformat {
noremap <F6> :Autoformat<CR>
let g:formatter_yapf_style = 'pep8'
let g:formatters_python = ['yapf']
let g:autoformat_verbosemode=1
let g:session_default_to_last = 1
"   }
"   deoplete {
let g:deoplete#enable_at_startup = 1
call deoplete#custom#set('buffer', 'mark', 'ℬ')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('omni', 'mark', '⌾')
call deoplete#custom#set('file', 'mark', 'file')
call deoplete#custom#set('jedi', 'mark', '')
call deoplete#custom#set('javacomplete2', 'mark', '')
call deoplete#custom#set('typescript', 'mark', '')
call deoplete#custom#set('neosnippet', 'mark', '')
"   }
"   vim-session {
nnoremap <Leader>os :OpenSession<CR>
let g:session_autosave = "yes"
let g:session_autoload = "no"
"let g:session_default_to_last = 1
"   }
"   IndentLine {
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'
" this is for vim-json plugin
autocmd InsertEnter *.json setlocal concealcursor=
autocmd InsertLeave *.json setlocal concealcursor=inc
"   }
"   NerdTree {
" Run NERDTreeTabs on console vim startup
let g:nerdtree_tabs_open_on_console_startup=0
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
"   }
"   UltiSnips {
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" When type UltisnipsEdit, the file will be saved into this dir
let g:UltiSnipsSnippetsDir="~/.vim/MySnips"
" Where UltiSnips find the snip files, the value should be runtimepath
let g:UltiSnipsSnippetDirectories = ['/home/damon/.vim/MySnips']
"   }
"   CtrlP {
let g:ctrlp_map = '<Leader>o'
"   }
"   Eclim {
" Import the class under the cursor with <leader>i
nnoremap <silent> <leader>i :JavaImportOrganize<cr>
" Search for the javadocs of the element under the cursor with <leader>d
nnoremap <silent> <leader>d :JavaDocSearch -x declarations<cr>
" Search element under the cursor
autocmd FileType java
            \ nnoremap <silent> <buffer> <leader>r :Java %<cr>
nnoremap <silent> <leader>js :JavaSearchContext<cr>
"nnoremap <silent> <leader>r :Java %<cr>
"   }
"   Airline {
"   }
"   Easymotion {
map <SPACE><SPACE> <Plug>(easymotion-f)
map <leader>f <Plug>(easymotion-F)
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_do_mapping = 1
" 1 will match 1 and !; ! matches !
let g:EasyMotion_use_smartsign_us = 1 " US layout
"   }
"   tern for vim {
"   document.getele
"let tern_show_signature_in_pum = 1
"let tern_show_argument_hints = 'on_hold'
"autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
"autocmd FileType javascript setlocal omnifunc=tern#Complete
"   }
"   Syntastic {
"nnoremap <silent> <Leader>c :SyntasticCheck<CR>
"nnoremap <silent> <Leader>ct :SyntasticToggleMode<CR>

"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_flake8_args='--ignore=E126,E127'
"let g:syntastic_javascript_closurecompiler_path = '~/.vim/closure-compiler.jar'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_error_symbol = '•'
"let g:syntastic_warning_symbol = '•'

"   }
"   ropevim {
" ----------------------------------------------------------------------------
" ropevim_for_vim
" ----------------------------------------------------------------------------
"let ropevim_local_prefix='<Leader>t'
"
let ropevim_vim_completion=1
let ropevim_extended_complete=1
let ropevim_codeassist_maxfixes=1
let ropevim_goto_def_newwin="tabnew"
let ropevim_autoimport_modules = ["os.*","traceback", "xml.etree"]
"imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>

autocmd FileType python
            \ noremap <silent> <buffer> <C-]> :RopeGotoDefinition<CR>
" }
"   Gundo {
nnoremap <F5> :GundoToggle<CR>
"   }
"   Tagbar {
nnoremap <F3> :TagbarToggle<CR>
"   }
"   devicons & nerdtree syntax highlight {
" loading the plugin
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_denite = 0
let g:webdevicons_enable_vimfiler = 0
" 去掉图标后面灰色的背景
autocmd FileType nerdtree setlocal nolist
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Show the folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 0
" }
"   markdown {
let g:table_mode_corner="|"
"   }
" }}}

" System Settings  ---------------------------------------------------------{{{

" The default leader is '\', but many people prefer ',' as it's in a
" standard location
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8
set encoding=utf8
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=2000                    " Store a ton of history (default is 20)
"set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set autoread                        " Set to auto read when a file is changed from the outside
set fileencodings=utf-8,gbk,cp936,latin-1
filetype on
set updatetime=250

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number " Line numbers on
set background=dark
set colorcolumn=80 " 80个字符的限制
"set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"

" 256 colors setting for nvim
set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

set tabpagemax=15 " Only show 15 tabs
set showmode " Display the current mode
set cursorline " Highlight current line
"highlight clear SignColumn " SignColumn should match background
"highlight clear LineNr " Current line number row will have same background color in relative mode
"highlight clear CursorLineNr " Remove highlight color from current line number

if has('cmdline_info')
set ruler " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd " Show partial commands in status line and
" Selected characters/lines in visual mode
endif

"if has('statusline')
"set laststatus=2

" Broken down into easily includeable segments
"set statusline=%<%f\ " Filename
"set statusline+=%w%h%m%r " Options
"set statusline+=\ [%{&ff}/%Y] " Filetype
"set statusline+=\ [%{getcwd()}] " Current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info


set backspace=indent,eol,start " Backspace for dummies
set showmatch " Show matching brackets/parenthesis
set incsearch " Find as you type search
set hlsearch " Highlight search terms
set winminheight=0 " Windows can be 0 line high
set ignorecase " Case insensitive search
set smartcase " case sensitive when uc present
set wildignorecase " Case insensitive when type command
set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,] " Backspace and cursor keys wrap too
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
"set foldmethod=indent "syntax
"set nofoldenable "启动vim时关闭代码折叠
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set cmdheight=2
set hid
set lazyredraw
set magic
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set tm=500

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
autocmd FocusLost * :set norelativenumber number
autocmd FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunc
nnoremap <F2> :call NumberToggle()<CR>
" Turn off hightlight until next search
nnoremap <F4> :noh<CR>

" Remember cursor position between vim sessions
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap " Wrap long lines
set autoindent " Indent at the same level of the previous line
set shiftwidth=4 " Use indents of 4 spaces
set expandtab " Tabs are spaces, not tabs
set tabstop=4 " An indentation every four columns
set softtabstop=4 " Let backspace delete indent
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current
"set linespace=5 " 字符间插入的像素行数目,only work for gvim

" set fillchar
"hi VertSplit ctermbg=NONE guibg=NONE
"hi VertSplit guibg=#282828 guifg=#181A1F
"set fillchars+=vert:│
"set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
"set matchpairs+=<:> " Match, to be used with %
set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks
" Remove trailing whitespaces and ^M chars
" To disable the stripping of whitespace, add the following to your
" .vimrc.before.local file:
let g:spf13_keep_trailing_whitespace = 1
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType java set tags=~/dev/jdk1.8.0_40/src/.tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
let g:vim_json_syntax_conceal = 1
"let $BASH_ENV = "/home/damon/.config/nvim/vim_bash"
" }}}

" Key Mappings -------------------------------------------------------------{{{

" Key (re)mappings {

"Exit insert mode
imap kj <Esc>

" No need for ex mode
nnoremap Q <nop>
nnoremap q: <nop>

" Navigate between display lines
noremap  <silent> k gk
noremap  <silent> j gj

" 跳转到行首和行位的非空字符
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
noremap <Leader>j J

"nnoremap ; :

nnoremap p p=`]
" Copy & paste to system clipboard
vmap <Leader>y "+y
nmap <Leader>y "+y
nmap <Leader>yy "+yy
"vmap <Leader>d "+d
vmap <Leader>p "+p
nmap <Leader>p "+p
"nmap <Leader>P "+P
"vmap <Leader>P "+P

" Insert a new line without entering insert mode
"set timeout timeoutlen=300 ttimeoutlen=100
nmap <CR> o<ESC>
" <S-CR> doesn't work. Known issue
"nmap <S-CR> O<ESC>j

" Switch between buffers. Since CtrlP use <c-p>, it's not available.
" Also,<C-S-n> is occupied by system.
" Aborted. <C-n> was occupied by vim-multi-cursors
"nnoremap <C-n> :bnext<CR>
"nnoremap <C-p> :bprevious<CR>

" Close stuffs
nnoremap <leader>xb :bp<cr>:bd #<cr>
nnoremap <leader>xw :q<cr>

nnoremap <leader>w :wall<cr>
" Select all
nnoremap <C-a> ggVG

" Command line mode  命令行模式增强
"cnoremap <C-h> <backspace>
cnoremap <C-d> <Del>
" to begin of command line
cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
" to begin of command line
if !has('nvim')
    execute "set <M-b>=\eb"
    execute "set <M-f>=\ef"
endif
cnoremap <M-b> <S-Left>
" one word right
cnoremap <M-f> <S-Right>
" Previous cmd based on input
cnoremap <C-k> <Up>
" Next cmd based on input
cnoremap <C-j> <Down>
" Cursor left
cnoremap <C-b> <Left>
" cursor right
cnoremap <C-f> <Right>

" Adjust current window's size
nmap <A-Down> <C-W>-
nmap <A-Up> <C-W>+
nmap <A-Left> <C-W>>
nmap <A-Right> <C-W><

" Auto save current buffer when leave insert mode
autocmd InsertLeave * update

" Shortcut for opening .vimrc
nmap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}

" Fold 代码折叠 ------------------------------------------------------------{{{

" 启用标记折叠。所有文本将按照特定标记（默认为{{{和}}}）自动折叠。
autocmd FileType vim setlocal foldmethod=marker
" foldlevel 0 代表全部折叠都生效，1：部分生效，99：不折叠
autocmd FileType vim setlocal foldlevel=0

autocmd FileType python setlocal foldmethod=indent
autocmd FileType css,scss setlocal foldmethod=marker
autocmd FileType css,scss setlocal foldmarker={,}
" }}}

" Functions ----------------------------------------------------------------{{{
" function {
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction

"function! Fcitx2zh()
    "let s:input_status = system("fcitx-remote")
    "if s:input_status != 2 && g:input_toggle == 1
        "let l:a = system("fcitx-remote -o")
        "let g:input_toggle = 0
    "endif
"endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
"autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######
" }
" }}}

" neovim settings ----------------------------------------------------------{{{
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" }}}

" Denite --------------------------------------------------------------------{{{

let s:menus = {}

call denite#custom#option('_', {
            \ 'prompt': '❯',
            \ 'winheight': 10,
            \ 'reversed': 1,
            \ 'highlight_matched_char': 'Underlined',
            \ 'highlight_mode_normal': 'CursorLine',
            \ 'updatetime': 1,
            \ 'auto_resize': 1,
            \})
"call denite#custom#option('TSDocumentSymbol', {
            "\ 'prompt': ' @' ,
            "\ 'reversed': 0,
            "\})
            "
"call denite#custom#var('file_rec', 'command',
            "\ ['rg', '--files', '--glob', '!.git', ''])
" 添加-u选项，因为rg会检索所有文件夹下的gitignore和ignore文件，包括父文件夹的
" -u表示忽略这两个文件的设置
" --hidden : Search hidden directories and files. (Hidden directories and files are skipped by default.)
" --files : Print each file that would be searched (but don't search).
call denite#custom#var('file_rec', 'command',['rg', '--hidden', '--files', '--glob', '!.git', '--no-ignore'])
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#source('grep', 'matchers', ['matcher_regexp'])

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
            \ [ '.git/', '.gvfs/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" --no-heading : Don't group matches by each file. Then file names will be shown for every line matched.
" --vimgrep : Show results with every match on its own line, including line numbers and column numbers.
"             With this option, a line with more than one match will be printed more than once.
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '--no-ignore'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <silent> <leader>df :Denite file_rec<CR>
nnoremap <silent> <leader>dg :Denite grep<CR>
nnoremap <silent> <leader>dl :Denite line<CR>
nnoremap <silent> <leader>dr :Denite file_mru<CR>
nnoremap <silent> <leader>dh :Denite help<CR>

"nnoremap <silent> <Leader>i :Denite menu:ionic <CR>
call denite#custom#map('insert','<C-j>','<denite:move_to_next_line>','noremap')
call denite#custom#map('insert','<C-k>','<denite:move_to_previous_line>','noremap')
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
call denite#custom#var('menu', 'menus', s:menus)

"}}}

" Airline -----------------------------------------------------------------{{{
" When complete option was triggered, a scratch window will display.
" When work with airline, a new buffer named [no nam] will be created
" displaying same content with scratch window. This will lead to a
" flickering when cycling complete options
set completeopt-=preview
let g:airline_powerline_fonts=1
"let g:airline_theme='violet'
"let g:airline_theme='badwolf'
"let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type= 2
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffers_label = 'BUFFERS'
let g:airline#extensions#tabline#tabs_label = 'TABS'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '➊ ',
            \ '2': '➋ ',
            \ '3': '➌ ',
            \ '4': '➍ ',
            \ '5': '➎ ',
            \ '6': '➏ ',
            \ '7': '➐ ',
            \ '8': '➑ ',
            \ '9': '➒ ',
            \}
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

function! s:bubble_num(num, type) abort
    let list = []
    call add(list,['➊', '➋', '➌', '➍', '➎', '➏', '➐', '➑', '➒', '➓'])
    call add(list,['➀', '➁', '➂', '➃', '➄', '➅', '➆', '➇', '➈', '➉'])
    call add(list,['⓵', '⓶', '⓷', '⓸', '⓹', '⓺', '⓻', '⓼', '⓽', '⓾'])
    let n = ''
    try
        let n = list[a:type][a:num-1]
    catch
    endtry
    return  n
endfunction
"let g:airline_section_c=s:bubble_num(tabpagewinnr(tabpagenr()), 1)
let g:airline_section_c='win[%{tabpagewinnr(tabpagenr())}]'
nnoremap <silent> <SPACE>1 :1wincmd w<CR>
nnoremap <silent> <SPACE>2 :2wincmd w<CR>
nnoremap <silent> <SPACE>3 :3wincmd w<CR>
nnoremap <silent> <SPACE>4 :4wincmd w<CR>
nnoremap <silent> <SPACE>5 :5wincmd w<CR>
nnoremap <silent> <SPACE>6 :6wincmd w<CR>
nnoremap <silent> <SPACE>7 :7wincmd w<CR>
nnoremap <silent> <SPACE>8 :8wincmd w<CR>
nnoremap <silent> <SPACE>9 :9wincmd w<CR>

" Show window number on airline's section c
"    let g:airline_section_a='a'
"    let g:airline_section_b='b'
"    let g:airline_section_c='c'
"    let g:airline_section_x='x'
"let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%%', 'linenr', 'maxlinenr', '[%{tabpagewinnr(tabpagenr())}] %{&encoding}'])
"    let g:airline_section_z='z'

" Just press <Leader><number> and be taken to the window number you want.
"let i = 1
"while i <= 9
"execute 'nnoremap <silent> <Leader>' . i . ' :' . i . 'wincmd w<CR>'
"let i = i + 1
"endwhile

" }}}

" vim-gitgutter ------------------------------------------------------------{{{
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }
" }}}

" Startify ------------------------------------------------------------------{{{
let g:my_welcome_bannars = [
            \ [
            \'',
            \'',
            \'',
            \'',
            \'    :::::::::      :::     ::::    ::::   ::::::::  ::::    ::: :::     ::: ::::::::::: ::::    ::::  ',
            \'    :+:    :+:   :+: :+:   +:+:+: :+:+:+ :+:    :+: :+:+:   :+: :+:     :+:     :+:     +:+:+: :+:+:+ ',
            \'    +:+    +:+  +:+   +:+  +:+ +:+:+ +:+ +:+    +:+ :+:+:+  +:+ +:+     +:+     +:+     +:+ +:+:+ +:+ ',
            \'    +#+    +:+ +#++:++#++: +#+  +:+  +#+ +#+    +:+ +#+ +:+ +#+ +#+     +:+     +#+     +#+  +:+  +#+ ',
            \'    +#+    +#+ +#+     +#+ +#+       +#+ +#+    +#+ +#+  +#+#+#  +#+   +#+      +#+     +#+       +#+ ',
            \'    #+#    #+# #+#     #+# #+#       #+# #+#    #+# #+#   #+#+#   #+#+#+#       #+#     #+#       #+# ',
            \'    #########  ###     ### ###       ###  ########  ###    ####     ###     ########### ###       ### ',
            \'',
            \'',
            \'',
            \ ],
            \ [
            \'',
            \'',
            \'',
            \'',
            \'    /$$$$$$$                                         /$$    /$$/$$              ',
            \'    | $$__  $$                                       | $$   | $|__/             ',
            \'    | $$  \ $$ /$$$$$$ /$$$$$$/$$$$  /$$$$$$ /$$$$$$$| $$   | $$/$$/$$$$$$/$$$$ ',
            \'    | $$  | $$|____  $| $$_  $$_  $$/$$__  $| $$__  $|  $$ / $$| $| $$_  $$_  $$',
            \'    | $$  | $$ /$$$$$$| $$ \ $$ \ $| $$  \ $| $$  \ $$\  $$ $$/| $| $$ \ $$ \ $$',
            \'    | $$  | $$/$$__  $| $$ | $$ | $| $$  | $| $$  | $$ \  $$$/ | $| $$ | $$ | $$',
            \'    | $$$$$$$|  $$$$$$| $$ | $$ | $|  $$$$$$| $$  | $$  \  $/  | $| $$ | $$ | $$',
            \'    |_______/ \_______|__/ |__/ |__/\______/|__/  |__/   \_/   |__|__/ |__/ |__/',
            \'',
            \'',
            \''
            \ ],
            \ [
            \'    ',
            \'    ',
            \'    ',
            \'      _____   ______  __    __  ______  __   __  __   ____  __    __    ',
            \'     /\  __-./\  __ \/\ "-./  \/\  __ \/\ "-.\ \/\ \ / /\ \/\ "-./  \   ',
            \'     \ \ \/\ \ \  __ \ \ \-./\ \ \ \/\ \ \ \-.  \ \ \`/\ \ \ \ \-./\ \  ',
            \'      \ \____-\ \_\ \_\ \_\ \ \_\ \_____\ \_\\"\_\ \__| \ \_\ \_\ \ \_\ ',
            \'       \/____/ \/_/\/_/\/_/  \/_/\/_____/\/_/ \/_/\/_/   \/_/\/_/  \/_/ ',
            \'    ',
            \'    ',
            \'    ',
            \ ],
            \ [
            \'',
            \'',
            \'',
            \'   oooooooooo.                                                     oooooo     oooo  o8o                    ',
            \'   `888`   `Y8b                                                     `888.     .8`   ``                    ',
            \'    888      888  .oooo.   ooo. .oo.  .oo.    .ooooo.  ooo. .oo.     `888.   .8`   oooo  ooo. .oo.  .oo.   ',
            \'    888      888 `P  )88b  888PY88bP"Y88b   d88` `88b `888P"Y88b      `888. .8`    `888  `888P"Y88bP"Y88b  ',
            \'    888      888  .oP888   888   888   888  888   888  888   888       `888.8`      888   888   888   888  ',
            \'    888     d88` d8(  888  888   888   888  888   888  888   888        `888`       888   888   888   888  ',
            \'   o888bood8P`   `Y888""8o o888o o888o o888o `Y8bod8P` o888o o888o       `8`       o888o o888o o888o o888o ',
            \'',
            \''],
            \ [
            \'    ',
            \'    ',
            \'    ',
            \'          ___         ___         ___         ___         ___                              ___     ',
            \'         /  /\       /  /\       /  /\       /  /\       /  /\       ___         ___      /  /\    ',
            \'        /  /::\     /  /::\     /  /::|     /  /::\     /  /::|     /  /\       /__/\    /  /::|   ',
            \'       /  /:/\:\   /  /:/\:\   /  /:|:|    /  /:/\:\   /  /:|:|    /  /:/       \__\:\  /  /:|:|   ',
            \'      /  /:/  \:\ /  /::\ \:\ /  /:/|:|__ /  /:/  \:\ /  /:/|:|__ /  /:/        /  /::\/  /:/|:|__ ',
            \'     /__/:/ \__\:/__/:/\:\_\:/__/:/_|::::/__/:/ \__\:/__/:/ |:| //__/:/  ___ __/  /:/\/__/:/_|::::\',
            \'     \  \:\ /  /:\__\/  \:\/:\__\/  /~~/:\  \:\ /  /:\__\/  |:|/:|  |:| /  //__/\/:/~~\__\/  /~~/:/',
            \'      \  \:\  /:/     \__\::/      /  /:/ \  \:\  /:/    |  |:/:/|  |:|/  /:\  \::/         /  /:/ ',
            \'       \  \:\/:/      /  /:/      /  /:/   \  \:\/:/     |__|::/ |__|:|__/:/ \  \:\        /  /:/  ',
            \'        \__\::/      /__/:/      /__/:/     \  \::/      /__/:/   \__\::::/   \__\/       /__/:/   ',
            \'            ~~       \__\/       \__\/       \__\/       \__\/        ~~~~                \__\/    ',
            \'    ',
            \'    ',
            \'    ',
            \ ],
            \ [
            \'    ',
            \'    ',
            \'    ',
            \'    ▓█████▄ ▄▄▄      ███▄ ▄███▓▒█████  ███▄    ███▒   █▓██▓███▄ ▄███▓',
            \'    ▒██▀ ██▒████▄   ▓██▒▀█▀ ██▒██▒  ██▒██ ▀█   ▓██░   █▓██▓██▒▀█▀ ██▒',
            \'    ░██   █▒██  ▀█▄ ▓██    ▓██▒██░  ██▓██  ▀█ ██▓██  █▒▒██▓██    ▓██░',
            \'    ░▓█▄   ░██▄▄▄▄██▒██    ▒██▒██   ██▓██▒  ▐▌██▒▒██ █░░██▒██    ▒██ ',
            \'    ░▒████▓ ▓█   ▓██▒██▒   ░██░ ████▓▒▒██░   ▓██░ ▒▀█░ ░██▒██▒   ░██▒',
            \'     ▒▒▓  ▒ ▒▒   ▓▒█░ ▒░   ░  ░ ▒░▒░▒░░ ▒░   ▒ ▒  ░ ▐░ ░▓ ░ ▒░   ░  ░',
            \'     ░ ▒  ▒  ▒   ▒▒ ░  ░      ░ ░ ▒ ▒░░ ░░   ░ ▒░ ░ ░░  ▒ ░  ░      ░',
            \'     ░ ░  ░  ░   ▒  ░      ░  ░ ░ ░ ▒    ░   ░ ░    ░░  ▒ ░      ░   ',
            \'       ░         ░  ░      ░      ░ ░          ░     ░  ░        ░   ',
            \'     ░                                              ░                ',
            \'    ',
            \'    ',
            \'    ',
            \ ],
            \ [
            \'',
            \'',
            \'',
            \'',
            \'    ████████▄     ▄████████   ▄▄▄▄███▄▄▄▄    ▄██████▄  ███▄▄▄▄    ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ',
            \'    ███   ▀███   ███    ███ ▄██▀▀▀███▀▀▀██▄ ███    ███ ███▀▀▀██▄ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ',
            \'    ███    ███   ███    ███ ███   ███   ███ ███    ███ ███   ███ ███    ███ ███▌ ███   ███   ███ ',
            \'    ███    ███   ███    ███ ███   ███   ███ ███    ███ ███   ███ ███    ███ ███▌ ███   ███   ███ ',
            \'    ███    ███ ▀███████████ ███   ███   ███ ███    ███ ███   ███ ███    ███ ███▌ ███   ███   ███ ',
            \'    ███    ███   ███    ███ ███   ███   ███ ███    ███ ███   ███ ███    ███ ███  ███   ███   ███ ',
            \'    ███   ▄███   ███    ███ ███   ███   ███ ███    ███ ███   ███ ███    ███ ███  ███   ███   ███ ',
            \'    ████████▀    ███    █▀   ▀█   ███   █▀   ▀██████▀   ▀█   █▀   ▀██████▀  █▀    ▀█   ███   █▀  ',
            \'',
            \'    ',
            \'    ',
            \'    ',
            \ ],
            \ [
            \'    ',
            \'    ',
            \'    ',
            \'     ____                                       __  __                     ',
            \'    /\  _`\                                    /\ \/\ \  __                ',
            \'    \ \ \/\ \    __      ___ ___     ___    ___\ \ \ \ \/\_\    ___ ___    ',
            \'     \ \ \ \ \ /`__`\  /` __` __`\  / __`\/` _ `\ \ \ \ \/\ \ /` __` __`\  ',
            \'      \ \ \_\ /\ \L\.\_/\ \/\ \/\ \/\ \L\ /\ \/\ \ \ \_/ \ \ \/\ \/\ \/\ \ ',
            \'       \ \____\ \__/.\_\ \_\ \_\ \_\ \____\ \_\ \_\ `\___/\ \_\ \_\ \_\ \_\',
            \'        \/___/ \/__/\/_/\/_/\/_/\/_/\/___/ \/_/\/_/`\/__/  \/_/\/_/\/_/\/_/',
            \'    ',
            \'    ',
            \'    ',
            \ ]
            \ ]
let g:startify_custom_header = g:my_welcome_bannars[6]

let g:startify_disable_at_vimenter = 0
let g:startify_session_dir = '~/.vim/sessions'
"let g:startify_files_number = 6
let g:startify_list_order = [
            \ ['   My most recently used files in the current directory:'],
            \ 'dir',
            \ ['   My most recently used files:'],
            \ 'files',
            \ ['   These are my sessions:'],
            \ 'sessions',
            \ ['   These are my bookmarks:'],
            \ 'bookmarks',
            \ ]
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'z': '~/.zshrc'} ]
let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
            \ 'bundle/.*/doc',
            \ ]
nnoremap <leader>s :Startify<CR>
" }}}

" vimfiler ------------------------------------------------------------------{{{
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = ''
let g:vimfiler_readonly_file_icon = '*'
let g:vimfiler_marked_file_icon = '√'
let g:vimfiler_direction = 'rightbelow'

let g:vimfiler_ignore_pattern = [
            \ '^\.git$',
            \ '^\.DS_Store$',
            \ '^\.init\.vim-rplugin\~$',
            \ '^\.netrwhist$',
            \ '\.class$'
            \]

"let g:vimfiler_quick_look_command = 'gloobus-preview'

call vimfiler#custom#profile('default', 'context', {
            \ 'explorer' : 1,
            \ 'winwidth' : 30,
            \ 'winminwidth' : 30,
            \ 'toggle' : 1,
            \ 'auto_expand': 1,
            \ 'direction' : g:vimfiler_direction,
            \ 'explorer_columns' : 1,
            \ 'parent': 0,
            \ 'status' : 1,
            \ 'safe' : 0,
            \ 'split' : 1,
            \ 'hidden': 1,
            \ 'no_quit' : 1,
            \ 'force_hide' : 0,
            \ })

augroup vfinit
    au!
    autocmd FileType vimfiler call s:vimfilerinit()
    autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'vimfiler') |
                \ q | endif
augroup END
function! s:vimfilerinit()
    setl nonumber
    setl norelativenumber

    silent! nunmap <buffer> <Space>
    silent! nunmap <buffer> <C-l>
    silent! nunmap <buffer> <C-j>
    silent! nunmap <buffer> E
    silent! nunmap <buffer> gr
    silent! nunmap <buffer> gf
    silent! nunmap <buffer> -
    silent! nunmap <buffer> s

    nnoremap <silent><buffer> gr  :<C-u>Denite grep:<C-R>=<SID>selected()<CR> -buffer-name=grep<CR>
    nnoremap <silent><buffer> gf  :<C-u>Denite file_rec:<C-R>=<SID>selected()<CR><CR>
    nnoremap <silent><buffer> gd  :<C-u>call <SID>change_vim_current_dir()<CR>
    nnoremap <silent><buffer><expr> sg  vimfiler#do_action('vsplit')
    nnoremap <silent><buffer><expr> sv  vimfiler#do_action('split')
    nnoremap <silent><buffer><expr> st  vimfiler#do_action('tabswitch')
    nmap <buffer> gx      <Plug>(vimfiler_execute_vimfiler_associated)
    nmap <buffer> '       <Plug>(vimfiler_toggle_mark_current_line)
    nmap <buffer> v       <Plug>(vimfiler_quick_look)
    nmap <buffer> p       <Plug>(vimfiler_preview_file)
    nmap <buffer> V       <Plug>(vimfiler_clear_mark_all_lines)
    nmap <buffer> i       <Plug>(vimfiler_switch_to_history_directory)
    nmap <buffer> <Tab>   <Plug>(vimfiler_switch_to_other_window)
    nmap <buffer> <C-r>   <Plug>(vimfiler_redraw_screen)
    nmap <buffer> <Left>  <Plug>(vimfiler_smart_h)
    nmap <buffer> <Right> <Plug>(vimfiler_smart_l)
endf
" }}}
"
" sample ------------------------------------------------------------------{{{
" }}}
