" Author:   Damon Ma
"
" SpaceVim_statusline_a 显示窗口编号的部分
" SpaceVim_statusline_b 文件名和文件大小
" SpaceVim_statusline_c FileType

scriptencoding utf-8

let g:_spacevim_statusline_loaded = 1
" APIs
" 各种数字和字母的特殊字符
let s:MESSLETTERS = damonvim#api#import('messletters')
" 当前时间
let s:TIME = damonvim#api#import('time')
" 高亮组
let s:HI = damonvim#api#import('vim#highlight')
" 生成statusline字符串
let s:STATUSLINE = damonvim#api#import('vim#statusline')
"let s:VIMCOMP = damonvim#api#import('vim#compatible')

" 区段间的分隔符
let s:separators = {
            \ 'arrow' : ["\ue0b0", "\ue0b2"],
            \ 'curve' : ["\ue0b4", "\ue0b6"],
            \ 'slant' : ["\ue0b8", "\ue0ba"],
            \ 'brace' : ["\ue0d2", "\ue0d4"],
            \ 'fire' : ["\ue0c0", "\ue0c2"],
            \ 'nil' : ['', ''],
            \ }
let s:loaded_modes = ['syntax-checking']
let s:modes = {
            \ 'center-cursor': {
            \ 'icon' : '⊝',
            \ 'desc' : 'centered-cursor mode',
            \ },
            \ 'hi-characters-for-long-lines' :{
            \ 'icon' : '⑧',
            \ 'desc' : 'toggle highlight of characters for long lines',
            \ },
            \ 'fill-column-indicator' :{
            \ 'icon' : s:MESSLETTERS.circled_letter('f'),
            \ 'desc' : 'fill-column-indicator mode',
            \ },
            \ 'syntax-checking' :{
            \ 'icon' : s:MESSLETTERS.circled_letter('s'),
            \ 'desc' : 'syntax-checking mode',
            \ },
            \ 'spell-checking' :{
            \ 'icon' : s:MESSLETTERS.circled_letter('S'),
            \ 'desc' : 'spell-checking mode',
            \ },
            \ 'whitespace' :{
            \ 'icon' : s:MESSLETTERS.circled_letter('w'),
            \ 'desc' : 'whitespace mode',
            \ },
            \ }

" 需要加载的模块
let s:loaded_sections = ['syntax checking', 'major mode', 'minor mode lighters', 'version control info', 'cursorpos']
" 获得左右分隔符，比如， 
let [s:lsep , s:rsep] = get(s:separators, g:spacevim_statusline_separator, s:separators['arrow'])
let s:colors_template = damonvim#theme#gruvbox#palette()

" 为tagbar生成statusline
function! TagbarStatusline(...) abort
    let name = (strwidth(a:3) > (g:spacevim_sidebar_width - 15)) ? a:3[:g:spacevim_sidebar_width - 20] . '..' : a:3
    return s:STATUSLINE.build([s:winnr(),' Tagbar ', ' ' . name . ' '], [], s:lsep, s:rsep,
                \ 'SpaceVim_statusline_ia', 'SpaceVim_statusline_b', 'SpaceVim_statusline_c', 'SpaceVim_statusline_z')
endfunction
let g:tagbar_status_func = 'TagbarStatusline'

" statusline 渲染的入口方法
function! damonvim#statusline#init() abort
    augroup SpaceVim_statusline
        autocmd!
        autocmd BufWinEnter,WinEnter,FileType
                    \ * call damonvim#statusline#initAle(1)
        autocmd BufWinLeave,WinLeave * call damonvim#statusline#initAle(0)
        autocmd ColorScheme * call damonvim#statusline#def_colors()
    augroup END
endfunction

function! damonvim#statusline#initAle(isActive)
    if a:isActive > 0
        if exists('g:ale_enabled')
            "autocmd!
            autocmd User ALELint,Startified unsilent
                        \ let &l:statusline = damonvim#statusline#get(1)
       endif
    endif
    let &l:statusline = damonvim#statusline#get(a:isActive)
endfunction

" a:0 = 1 BufWinEnter, WinEnter, Filetype
" a:0 = 0 BufWinLeave, WinLeave
" 生成statusline
function! damonvim#statusline#get(...) abort
    if &filetype ==# 'nerdtree'
        return s:STATUSLINE.build([s:winnr(),' NERDTree ', ' ' . ' ' . ' '], [], s:lsep, s:rsep,
                    \ 'SpaceVim_statusline_ia', 'SpaceVim_statusline_b', 'SpaceVim_statusline_c', 'SpaceVim_statusline_z')
        "return '%#SpaceVim_statusline_ia#' . s:winnr(1) . '%#SpaceVim_statusline_iaSpaceVim_statusline_b#'
                    "\ . '%#SpaceVim_statusline_b# NERDTree %#SpaceVim_statusline_b_SpaceVim_statusline_c#'
    elseif &filetype ==# 'tagbar'
        return "tagbar"
        "return '%#SpaceVim_statusline_ia# ' . s:winnr(1) . ' %#SpaceVim_statusline_a_b#'
                    "\ . '%#SpaceVim_statusline_b# tagbar %#SpaceVim_statusline_b_c#'
    elseif &filetype ==# 'startify'
        let lsec = [' ', ' Startify ']
        let lock =  ' %#SpaceVim_statusline_lock#' . ''
        call add(lsec, lock)
        let rsec = []
        "" file type
        "if index(s:loaded_sections, 'major mode') != -1 && !empty(&filetype)
            "call add(lsec, ' ' . &filetype . ' ')
        "endif
        "let rsec = []
        "if index(s:loaded_sections, 'syntax checking') != -1 && s:syntax_checking() != ''
            "call add(lsec, s:syntax_checking())
        "endif
        "" 各种小功能的图标
        "if index(s:loaded_sections, 'minor mode lighters') != -1
            "call add(lsec, s:modes())
        "endif
        "" git info
        "if index(s:loaded_sections, 'version control info') != -1
            "call add(lsec, s:git_branch())
        "endif
        "call add(lsec, SpaceVim#plugins#searcher#count())
        "if index(s:loaded_sections, 'battery status') != -1
        "call add(rsec, s:battery_status())
        "endif
        "call add(rsec, '%{" " . &ff . " | " . (&fenc!=""?&fenc:&enc) . " "}')
        "if index(s:loaded_sections, 'cursorpos') != -1
            "call add(rsec, s:cursorpos())
        "endif
        "call add(rsec, ' %P ')
        "if index(s:loaded_sections, 'time') != -1
            "call add(rsec, s:time())
        "endif

        "if index(s:loaded_sections, 'whitespace') != -1
            "call add(rsec, s:whitespace())
        "endif
        call fugitive#detect(getcwd())
        return s:STATUSLINE.build(lsec, rsec, s:lsep, s:rsep,
                    \ 'SpaceVim_statusline_a', 'SpaceVim_statusline_b', 'SpaceVim_statusline_c', 'SpaceVim_statusline_z')
        "return s:STATUSLINE.build([' ',' Startify ', '  ' . ' ' . ' '], [], s:lsep, s:rsep,
                    "\ 'SpaceVim_statusline_ia', 'SpaceVim_statusline_b', 'SpaceVim_statusline_c', 'SpaceVim_statusline_z')
    elseif &filetype ==# 'denite'
        return '%#SpaceVim_statusline_a_bold# %{damonvim#statusline#denite_mode()} '
                    \ . '%#SpaceVim_statusline_a_bold_SpaceVim_statusline_b# '
                    \ . '%#SpaceVim_statusline_b#%{denite#get_status_sources()} %#SpaceVim_statusline_b_SpaceVim_statusline_z# '
                    \ . '%#SpaceVim_statusline_z#%=%#SpaceVim_statusline_c_SpaceVim_statusline_z#'
                    \ . '%#SpaceVim_statusline_c# %{denite#get_status_path() . denite#get_status_linenr()}'
    "elseif &filetype ==# 'unite'
        "return '%#SpaceVim_statusline_a_bold#%{SpaceVim#layers#core#statusline#unite_mode()} Unite '
                    "\ . '%#SpaceVim_statusline_a_bold_SpaceVim_statusline_b# %{get(unite#get_context(), "buffer_name", "")} '
                    "\ . '%#SpaceVim_statusline_b_SpaceVim_statusline_c# '
                    "\ . '%#SpaceVim_statusline_c# %{unite#get_status_string()} '
    "elseif &filetype ==# 'SpaceVimFlyGrep'
        "return '%#SpaceVim_statusline_a# FlyGrep %#SpaceVim_statusline_a_SpaceVim_statusline_b#'
                    "\ . '%#SpaceVim_statusline_b# %{getcwd()}%#SpaceVim_statusline_b_SpaceVim_statusline_c#'
                    "\ . '%#SpaceVim_statusline_c# %{SpaceVim#plugins#flygrep#lineNr()}'
    endif
    if a:0 > 0 && a:1 > 0
        return s:active()
    else
        return s:inactive()
    endif
endfunction

if g:spacevim_enable_ale
    function! s:syntax_checking()
        if !exists('g:ale_enabled')
            return ''
        endif
        let counts = ale#statusline#Count(bufnr(''))
        "echom string(counts)
        let warnings = get(counts, 'warning', 0)
        let errors = get(counts, 'error', 0)
        let style_warnings = get(counts, 'style_warning', 0)
        let style_errors = get(counts, 'style_error', 0)
        let l =  ' %#SpaceVim_statusline_warn#•' . warnings . ' '
        let l .=  '%#SpaceVim_statusline_error#•' . errors  . ' '
        let l .=  '%#SpaceVim_statusline_style_warn#•' . style_warnings . ' '
        let l .=  '%#SpaceVim_statusline_style_error#•' . style_errors  . ' '
        "let l .=  warnings ? ' %#SpaceVim_statusline_warn#●' . warnings . ' ' : ''
        "let l .=  errors ? (warnings ? '' : ' ') . '%#SpaceVim_statusline_error#●' . errors  . ' ' : ''
        return l
    endfunction
else
    function! s:syntax_checking()
        if !exists(':SyntasticCheck')
            return ''
        endif
        let l = SyntasticStatuslineFlag()
        if strlen(l) > 0
            return l
        else
            return ''
        endif
    endfunction
endif

" 返回当前激活窗口的statusline
function! s:active() abort
    let lsec = [s:winnr(), s:filename()]
    "if index(s:loaded_sections, 'search status') != -1
        "call add(lsec, s:search_status())
    "endif
    " file type
    if index(s:loaded_sections, 'major mode') != -1 && !empty(&filetype)
        call add(lsec, ' ' . &filetype . ' ')
    endif
    let rsec = []
    if index(s:loaded_sections, 'syntax checking') != -1 && s:syntax_checking() != ''
        call add(lsec, s:syntax_checking())
    endif
    " 各种小功能的图标
    if index(s:loaded_sections, 'minor mode lighters') != -1
        call add(lsec, s:modes())
    endif
    " git info
    if index(s:loaded_sections, 'version control info') != -1
        call add(lsec, s:git_branch())
    endif
    "call add(lsec, SpaceVim#plugins#searcher#count())
    "if index(s:loaded_sections, 'battery status') != -1
        "call add(rsec, s:battery_status())
    "endif
    call add(rsec, '%{" " . &ff . " | " . (&fenc!=""?&fenc:&enc) . " "}')
    if index(s:loaded_sections, 'cursorpos') != -1
        call add(rsec, s:cursorpos())
    endif
    call add(rsec, ' %P ')
    if index(s:loaded_sections, 'time') != -1
        call add(rsec, s:time())
    endif

    if index(s:loaded_sections, 'whitespace') != -1
        call add(rsec, s:whitespace())
    endif
    return s:STATUSLINE.build(lsec, rsec, s:lsep, s:rsep,
                \ 'SpaceVim_statusline_a', 'SpaceVim_statusline_b', 'SpaceVim_statusline_c', 'SpaceVim_statusline_z')
endfunction

" 返回未激活窗口的statusline
function! s:inactive() abort
    return '%#SpaceVim_statusline_ia#' . s:winnr() . '%#SpaceVim_statusline_ia_SpaceVim_statusline_b#'
                \ . '%#SpaceVim_statusline_b#' . s:filename() . ''
                \ . ' ' . &filetype . ' ' 
                \ . s:modes() . ''
                \ . s:git_branch() . ''
                \ . ' %='
                \ . '%{" " . &ff . "|" . (&fenc!=""?&fenc:&enc) . " "}'
                \ . ' %P '
endfunction

" 为statusline定义所有的高亮组，之后会用在highlight.vim中用到
function! damonvim#statusline#def_colors() abort
    let name = get(g:, 'colors_name', 'gruvbox')
    try
        let t = damonvim#theme#{name}#palette()
    catch /^Vim\%((\a\+)\)\=:E117/
        let t = damonvim#theme#gruvbox#palette()
    endtry
    let s:colors_template = t
    exe 'hi! SpaceVim_statusline_a ctermbg=' . t[0][2] . ' ctermfg=' . t[0][3] . ' guibg=' . t[0][1] . ' guifg=' . t[0][0]
    exe 'hi! SpaceVim_statusline_a_bold cterm=bold gui=bold ctermbg=' . t[0][2] . ' ctermfg=' . t[0][3] . ' guibg=' . t[0][1] . ' guifg=' . t[0][0]
    exe 'hi! SpaceVim_statusline_ia ctermbg=' . t[0][2] . ' ctermfg=' . t[0][3] . ' guibg=' . t[0][1] . ' guifg=' . t[0][0]
    exe 'hi! SpaceVim_statusline_b ctermbg=' . t[1][2] . ' ctermfg=' . t[1][3] . ' guibg=' . t[1][1] . ' guifg=' . t[1][0]
    exe 'hi! SpaceVim_statusline_c ctermbg=' . t[2][2] . ' ctermfg=' . t[2][3] . ' guibg=' . t[2][1] . ' guifg=' . t[2][0]
    exe 'hi! SpaceVim_statusline_z ctermbg=' . t[3][1] . ' ctermfg=' . t[3][1] . ' guibg=' . t[3][0] . ' guifg=' . t[3][0]
    hi! SpaceVim_statusline_error ctermbg=003 ctermfg=Black guibg=#504945 guifg=#fb4934 gui=bold
    hi! SpaceVim_statusline_warn ctermbg=003 ctermfg=Black guibg=#504945 guifg=#fabd2f gui=bold
    hi! SpaceVim_statusline_style_error ctermbg=003 ctermfg=Black guibg=#504945 guifg=#EC7063 gui=bold
    hi! SpaceVim_statusline_style_warn ctermbg=003 ctermfg=Black guibg=#504945 guifg=#F9E79F gui=bold
    hi! SpaceVim_statusline_lock ctermbg=003 ctermfg=Black guibg=#3c3836 guifg=#fabd2f gui=bold
    "SpaceVim_statusline_c xxx ctermfg=246 ctermbg=237 guifg=#a89984 guibg=#3c3836
    call s:HI.hi_separator('SpaceVim_statusline_a', 'SpaceVim_statusline_b')
    call s:HI.hi_separator('SpaceVim_statusline_a_bold', 'SpaceVim_statusline_b')
    call s:HI.hi_separator('SpaceVim_statusline_ia', 'SpaceVim_statusline_b')
    call s:HI.hi_separator('SpaceVim_statusline_b', 'SpaceVim_statusline_c')
    call s:HI.hi_separator('SpaceVim_statusline_b', 'SpaceVim_statusline_z')
    call s:HI.hi_separator('SpaceVim_statusline_c', 'SpaceVim_statusline_z')
endfunction

" 根据不同的vim模式改变statusline_a的颜色
function! damonvim#statusline#mode(mode)
    let t = s:colors_template

    if get(w:, 'spacevim_statusline_mode', '') != a:mode
        if a:mode == 'n'
            exe 'hi! SpaceVim_statusline_a ctermbg=' . t[0][2] . ' ctermfg=' . t[0][3] . ' guibg=' . t[0][1] . ' guifg=' . t[0][0]
        elseif a:mode == 'i'
            exe 'hi! SpaceVim_statusline_a ctermbg=' . t[4][3] . ' ctermfg=' . t[4][2] . ' guibg=' . t[4][1] . ' guifg=' . t[4][0]
        elseif a:mode == 'R'
            exe 'hi! SpaceVim_statusline_a ctermbg=' . t[6][3] . ' ctermfg=' . t[6][2] . ' guibg=' . t[6][1] . ' guifg=' . t[6][0]
        elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
            exe 'hi! SpaceVim_statusline_a ctermbg=' . t[5][3] . ' ctermfg=' . t[5][2] . ' guibg=' . t[5][1] . ' guifg=' . t[5][0]
        endif
        call s:HI.hi_separator('SpaceVim_statusline_a', 'SpaceVim_statusline_b')
        let w:spacevim_statusline_mode = a:mode
    endif
    return ''
endfunction

function! damonvim#statusline#denite_mode()
    let t = s:colors_template
    let dmode = split(denite#get_status_mode())[1]
    if get(w:, 'spacevim_statusline_mode', '') != dmode
        if dmode == 'NORMAL'
            exe 'hi! SpaceVim_statusline_a_bold cterm=bold gui=bold ctermbg=' . t[0][2] . ' ctermfg=' . t[0][3] . ' guibg=' . t[0][1] . ' guifg=' . t[0][0]
        elseif dmode == 'INSERT'
            exe 'hi! SpaceVim_statusline_a_bold cterm=bold gui=bold ctermbg=' . t[4][3] . ' ctermfg=' . t[4][2] . ' guibg=' . t[4][1] . ' guifg=' . t[4][0]
        endif
        call s:HI.hi_separator('SpaceVim_statusline_a_bold', 'SpaceVim_statusline_b')
        let w:spacevim_statusline_mode = dmode
    endif
    return dmode
endfunction

" a:0 BufWinEnter, WinEnter, Filetype
" 返回格式化后的窗口编号
function! s:winnr(...) abort
    if a:0 > 1
        return ' ' . s:MESSLETTERS.circled_num(winnr(), g:spacevim_windows_index_type) . ' '
    else
        return '%{damonvim#statusline#mode(mode())} ' . s:MESSLETTERS.circled_num(winnr(), g:spacevim_windows_index_type) . ' '
    endif
endfunction

function! s:gitgutter() abort
    if exists('b:gitgutter_summary')
        let l:summary = get(b:, 'gitgutter_summary')
        if l:summary[0] != 0 || l:summary[1] != 0 || l:summary[2] != 0
            return ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' '
        endif
    endif
    return ''
endfunction


function! s:filename() abort
    let name = fnamemodify(bufname('%'), ':t')
    if empty(name)
        let name = 'No Name'
    endif
    return (&modified ? ' * ' : ' - ') . s:filesize() . name . ' '
endfunction

function! s:filesize() abort
    let l:size = getfsize(bufname('%'))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ''
    endif
    if l:size < 1024
        return l:size.' bytes '
    elseif l:size < 1024*1024
        return printf('%.1f', l:size/1024.0).'k '
    elseif l:size < 1024*1024*1024
        return printf('%.1f', l:size/1024.0/1024.0) . 'm '
    else
        return printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'g '
    endif
endfunction

" 显示加载模块的图标
function! s:modes() abort
    let m = ' ❖ '
    for mode in s:loaded_modes
        let m .= s:modes[mode].icon . ' '
    endfor
    return m . ' '
endfunction

function! s:git_branch() abort
    if exists('g:loaded_fugitive')
        let l:head = fugitive#head()
        if empty(l:head)
            call fugitive#detect(getcwd())
            let l:head = fugitive#head()
        endif
        return empty(l:head) ? '' : '  '.l:head . ' '
    endif
    return ''
endfunction

" cursor position [row num]:[column num]
function! s:cursorpos() abort
    return ' %l:%c '
endfunction

function! s:whitespace() abort
    let ln = search('\s\+$', 'n')
    if ln != 0
        return ' trailing[' . ln . '] '
    else
        return ''
    endif
endfunction
