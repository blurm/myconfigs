

"------------------------- Vundle ------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Other plugins
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'

Plugin 'Yggdroot/indentLine'
Plugin 'xolox/vim-misc' "vim-session need to use
Plugin 'xolox/vim-session'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/VisIncr'
Plugin 'easymotion/vim-easymotion'

Plugin 'godlygeek/tabular'       " For text filtering and alignment
Plugin 'ternjs/tern_for_vim'

Plugin 'scrooloose/syntastic'  " Syntax check
Plugin 'Shutnik/jshint2.vim'
Plugin 'sjl/gundo.vim'  " Visualize your Vim undo tree.

" for python
Plugin 'python-rope/ropevim'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'klen/python-mode'
"Plugin 'sjl/gundo.vim'
"Plugin 'ConradIrwin/vim-bracketed-paste'
"Plugin 'neilagabriel/vim-geeknote'
"Plugin 'Raimondi/delimitMate'
"Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"------------------------- Vundle end -----------------------------------------

" The default leader is '\', but many people prefer ',' as it's in a
" standard location
let mapleader=","

" Plugin Settings {
"   vim-session {
        nnoremap <Leader>os :OpenSession<CR>
        let g:session_autosave = "yes"
        let g:session_autoload = "no"
        "let g:session_default_to_last = 1
"   }
"   IndentLine {
        let g:indentLine_color_term = 239
        let g:indentLine_char = '¦'
"   }
"   NerdTree {
        " Run NERDTreeTabs on console vim startup
        let g:nerdtree_tabs_open_on_console_startup=0
        nnoremap <silent> <leader>n :NERDTreeToggle<CR>
"   }
"   Geeknote {
        " Set the format when saving notes to Geeknote
        " let g:GeeknoteFormat="txt"
"   }
"   UltiSnips {
        " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
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
"   Airline {
        " When complete option was triggered, a scratch window will display.
        " When work with airline, a new buffer named [no nam] will be created
        " displaying same content with scratch window. This will lead to a
        " flickering when cycling complete options
        set completeopt-=preview
        let g:airline_powerline_fonts=1
        let g:airline_theme='bubblegum'
        let g:airline#extensions#tabline#enabled = 1
       " }

"   YouCompleteMe {
        let g:acp_enableAtStartup = 0
        " enable completion from tags
        let g:ycm_collect_identifiers_from_tags_files = 1

        " Remapping completion triggering
        let g:ycm_key_invoke_completion = '<C-j>'
        let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

        " Using Eclim for completion
        let g:EclimCompletionMethod = 'omnifunc'

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

        "let g:ycm_filetype_blacklist = { 'python': 1 }

        " Specify the tag file for Java src
        autocmd FileType java set tags=~/dev/jdk1.8.0_40/src/.tags
    " }
"   CtrlP {
        let g:ctrlp_map = '<Leader>o'
"   }
"   Eclim {
        " Import the class under the cursor with <leader>i
        nnoremap <silent> <leader>i :JavaImportOrganize<cr>
        " Search for the javadocs of the element under the cursor with <leader>d
        nnoremap <silent> <leader>d :JavaDocSearch -x declarations<cr>
        " Search element under the cursor
        au FileType java
                    \ nnoremap <silent> <buffer> <leader>r :Java %<cr>
        nnoremap <silent> <leader>s :JavaSearchContext<cr>
        "nnoremap <silent> <leader>r :Java %<cr>
"   }
"   Airline {
        " ---------------- Airline -----------------------------
        " Show window number on airline's section c
        "    let g:airline_section_a='a'
        "    let g:airline_section_b='b'
        "    let g:airline_section_c='c'
        "    let g:airline_section_x='x'
        "let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%%', 'linenr', 'maxlinenr', '[%{tabpagewinnr(tabpagenr())}] %{&encoding}'])
        "    let g:airline_section_z='z'
        let g:airline_section_c='win[%{tabpagewinnr(tabpagenr())}]'

        " Just press <Leader><number> and be taken to the window number you want.
        let i = 1
        while i <= 9
            execute 'nnoremap <silent> <Leader>' . i . ' :' . i . 'wincmd w<CR>'
            let i = i + 1
        endwhile

        nnoremap <silent> <Leader>1 :1wincmd w<CR>
        nnoremap <silent> <Leader>2 :2wincmd w<CR>
        nnoremap <silent> <Leader>3 :3wincmd w<CR>
        nnoremap <silent> <Leader>4 :4wincmd w<CR>
        nnoremap <silent> <Leader>5 :5wincmd w<CR>
        nnoremap <silent> <Leader>6 :6wincmd w<CR>
        nnoremap <silent> <Leader>7 :7wincmd w<CR>
        nnoremap <silent> <Leader>8 :8wincmd w<CR>
        nnoremap <silent> <Leader>9 :9wincmd w<CR>
"   }
"   Easymotion {
        map <SPACE> <Plug>(easymotion-f)
        let g:EasyMotion_smartcase = 1
        " 1 will match 1 and !; ! matches !
        let g:EasyMotion_use_smartsign_us = 1 " US layout
"   }
"   tern for vim {
        let tern_show_signature_in_pum = 1
        let tern_show_argument_hints = 'on_hold'
        autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
        autocmd FileType javascript setlocal omnifunc=tern#Complete
"   }
"   Syntastic {
        "let g:syntastic_javascript_checkers = ['closurecompiler']
        nnoremap <silent> <Leader>c :SyntasticCheck<CR>
        nnoremap <silent> <Leader>ct :SyntasticToggleMode<CR>

        let g:syntastic_javascript_checkers = ['jshint']
        let g:syntastic_python_checkers = ['flake8']
        let g:syntastic_python_flake8_args='--ignore=E126,E127'
        let g:syntastic_javascript_closurecompiler_path = '~/.vim/closure-compiler.jar'
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        "let g:syntastic_check_on_wq = 0
"   }
"   ropevim {
        " ----------------------------------------------------------------------------
        " ropevim_for_vim
        " ----------------------------------------------------------------------------
        "let ropevim_local_prefix='<Leader>t'
        let ropevim_vim_completion=1
        let ropevim_extended_complete=1
        let ropevim_codeassist_maxfixes=1
        let ropevim_goto_def_newwin="tabnew"
        let ropevim_autoimport_modules = ["os.*","traceback", "xml.etree"]
        "imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>

        au FileType python
            \ noremap <silent> <buffer> <C-]> :RopeGotoDefinition<CR>
" }
"   Gundo {
        nnoremap <F5> :GundoToggle<CR>
"   }
"   Tagbar {
        nnoremap <F3> :TagbarToggle<CR>
"   }



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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number " Line numbers on
set colorcolumn=80
set t_Co=256
set background=dark
let g:solarized_termcolors=256
"let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
colorscheme solarized
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
set linespace=0 " No extra spaces between rows
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
set foldmethod=indent "syntax
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
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
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
set linespace=0 " 字符间插入的像素行数目

set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keys Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key (re)mappings {

"Exit insert mode
imap kj <Esc>

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
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <leader>q :bp<cr>:bd #<cr>
nnoremap <leader>w :wall<cr>

nnoremap <C-a> ggVG

" Command line mode  命令行模式增强
"cnoremap <C-h> <backspace>
cnoremap <C-d> <Del>
" to begin of command line
cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
" to begin of command line
execute "set <M-b>=\eb"
cnoremap <M-b> <S-Left>
" one word right
execute "set <M-f>=\ef"
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" }
