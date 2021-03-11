filetype on
filetype plugin indent on
syntax on

let g:polyglot_disabled = ['markdown.plugin', 'pandoc.plugin', 'rust.plugin']

lua require('init')

set noswapfile
set undofile
set undodir="$HOME/.local/share/nvim/undodir"
set undolevels=1000
set undoreload=10000

let g:startify_custom_header = startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')
let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']             },
            \ { 'type': 'dir',       'header': ['   Recent in '. getcwd()] },
            \ { 'type': 'files',     'header': ['   Recent']               },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']            },
            \ { 'type': 'commands',  'header': ['   Commands']             },
            \ ]


function! SynStack()
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunc

" get highlight under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" autocommands
augroup auto_commands
    autocmd!
    autocmd FileType markdown,pandoc call SetupMarkdown()
    " autocmd FileType rust setlocal formatprg="rustfmt"
    " autocmd BufWinLeave * silent! mkview
    " autocmd BufWinEnter * silent! loadview
    autocmd BufEnter * checktime
    autocmd CursorHold * nested call AutoSave()
    autocmd BufEnter * lua require'completion'.on_attach()
augroup END

" change gutter (SignColumn) color to clear
hi! SignColumn guibg=NONE ctermbg=NONE
hi! LineNr ctermfg=4 guibg=NONE ctermbg=NONE

hi! MatchParen cterm=bold ctermbg=8 ctermfg=231 gui=bold guibg=8 guifg=white
hi! FoldColumn guibg=NONE ctermbg=NONE
hi! CursorLineNr guibg=8 ctermbg=8 cterm=bold gui=bold guifg=white ctermfg=231
hi! CursorLine guibg=8 ctermbg=8 cterm=NONE gui=NONE ctermfg=NONE guifg=NONE
hi! CursorColumn guibg=8 ctermbg=8 cterm=NONE gui=NONE ctermfg=NONE guifg=NONE
hi! Folded guibg=0 ctermbg=0 guifg=4 ctermfg=4 gui=italic cterm=italic
hi! ColorColumn guibg=52 ctermbg=52

hi! Error guibg=NONE ctermbg=NONE guifg=red ctermfg=196 gui=bold cterm=bold
hi! Warning guibg=NONE ctermbg=NONE guifg=yellow ctermfg=226 gui=bold cterm=bold
hi! Info guibg=NONE ctermbg=NONE guifg=cyan ctermfg=51 gui=bold cterm=bold

hi! link ErrorMsg Error
hi! link WarningMsg Warning
hi! link InfoMsg Info

" LSP highlights
hi! link LspDiagnosticsDefaultError Error
hi! link LspDiagnosticsDefaultWarning Warning
hi! link LspDiagnosticsDefaultHint Info
hi! link LspDiagnosticsDefaultInformation Info

hi! link LspDiagnosticsErrorSign Error
hi! link LspDiagnosticsWarningSign Warning
hi! link LspDiagnosticsHintSign Info
hi! link LspDiagnosticsInformationSign Info

hi! link LspDiagnosticsVirtualTextError Error
hi! link LspDiagnosticsVirtualTextWarning Warning
hi! link LspDiagnosticsVirtualTextHint Info
hi! link LspDiagnosticsVirtualTextInformation Info

hi! link LspDiagnosticsUnderlineError Error
hi! link LspDiagnosticsUnderlineWarning Warning
hi! link LspDiagnosticsUnderlineHint Info
hi! link LspDiagnosticsUnderlineInformation Info

hi! Comment ctermbg=NONE guibg=NONE ctermfg=12 guifg=12
hi! Conceal ctermbg=0
hi! Delimiter ctermbg=NONE guibg=NONE
hi! Exception ctermbg=NONE guibg=NONE
hi! IncSearch cterm=bold,italic,reverse gui=bold,italic,reverse
hi! NonText cterm=NONE gui=NONE ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE
hi! PreProc ctermfg=14 guifg=14
hi! Search ctermfg=15 guifg=15 ctermbg=240 guibg=240 cterm=italic gui=italic
hi! Special ctermfg=9 guifg=9
hi! SpecialChar ctermfg=13 guifg=13 ctermbg=NONE guibg=NONE
hi! SpecialComment ctermfg=12 ctermbg=NONE ctermfg=12 guibg=NONE cterm=bold,italic gui=bold,italic term=bold,italic
hi! StatusLine cterm=NONE ctermbg=NONE ctermfg=8 guibg=NONE guifg=8
hi! StatusLineNC cterm=NONE ctermbg=NONE ctermfg=8 guibg=NONE guifg=8
hi! Title cterm=bold gui=bold ctermfg=13 guifg=13
hi! Type ctermfg=10 guifg=10
hi! Typedef ctermbg=NONE guibg=NONE
hi! VertSplit guibg=NONE guifg=8 gui=NONE ctermbg=NONE ctermfg=8 cterm=NONE
hi! VirtualText cterm=italic gui=italic ctermfg=4 guifg=4 ctermbg=NONE guibg=NONE
hi! Visual ctermbg=240 guibg=240 ctermfg=15 guifg=15
hi! Whitespace ctermfg=8 guifg=8

hi! link javaScriptLineComment Comment

hi! DiffAdd ctermbg=NONE guibg=NONE ctermfg=48 guifg=green
hi! DiffChange ctermbg=NONE guibg=NONE ctermfg=214 guifg=orange
hi! DiffDelete ctermbg=NONE guibg=NONE ctermfg=196 guifg=red
hi! DiffText ctermbg=NONE guibg=NONE ctermfg=214 guifg=orange cterm=undercurl gui=undercurl

hi! link GitGutterAdd DiffAdd
hi! link GitGutterChange DiffChange
hi! link GitGutterDelete DiffDelete

hi! Pmenu cterm=NONE gui=NONE ctermbg=8 ctermfg=14 guibg=8 guifg=14
hi! PmenuSel cterm=bold gui=bold ctermbg=6 ctermfg=8 guibg=6 guifg=8
hi! PmenuSbar cterm=NONE gui=NONE ctermbg=0 ctermfg=0 guibg=0 guifg=0
hi! PmenuThumb cterm=NONE gui=NONE ctermbg=5 ctermfg=5 guibg=5 guifg=5

hi! SpellBad ctermfg=196 ctermbg=NONE guifg=196 guibg=NONE cterm=italic,undercurl gui=italic,undercurl
hi! SpellCap ctermfg=201 ctermbg=NONE guifg=201 guibg=NONE
hi! SpellRare ctermfg=214 ctermbg=NONE guifg=214 guibg=NONE cterm=italic gui=italic
hi! link SpellLocal SpellRare
hi! Todo ctermfg=214 ctermbg=NONE guifg=214 guibg=NONE cterm=italic,bold gui=italic,bold

hi! SpecialKey ctermfg=14 guifg=14
hi! Directory ctermfg=14 guifg=14
hi! Question ctermfg=10 guifg=10
hi! link MoreMsg Question
hi! link NvimInternalError Error

sign define LspDiagnosticsSignError text=X texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=! texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=i texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=h texthl=LspDiagnosticsSignHint linehl= numhl=

fu! UpdateGitInfo()
    let b:custom_git_branch = ''
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            b:custom_git_branch = fugitive#head
        endif
    catch
    endtry
    return b:custom_git_branch
endfu

function! WordCount()
    if &filetype == "markdown"
        let currentmode = mode()
        if !exists("g:lastmode_wc")
            let g:lastmode_wc = currentmode
        endif
        " if we modify file, open a new buffer, be in visual ever, or switch modes
        " since last run, we recompute.
        if &modified || !exists("b:wordcount") || currentmode =~? '\c.*v' || currentmode != g:lastmode_wc
            let g:lastmode_wc = currentmode
            let l:old_position = getpos('.')
            let l:old_status = v:statusmsg
            execute "silent normal g\<c-g>"
            if v:statusmsg == "--No lines in buffer--"
                let b:wordcount = 0
            else
                let s:split_wc = split(v:statusmsg)
                if index(s:split_wc, "Selected") < 0
                    let b:wordcount = str2nr(s:split_wc[11])
                else
                    let b:wordcount = str2nr(s:split_wc[5])
                endif
                let v:statusmsg = l:old_status
            endif
            call setpos('.', l:old_position)
            return b:wordcount . " words"
        else
            return b:wordcount . " words"
        endif
    else
        return ""
    endif
endfunction

function! MarkdownFoldText()
    let linetext = getline(v:foldstart)
    let txt = linetext . ' [...] '
    return txt
endfunction

function! SetupMarkdown()
    setlocal noexpandtab 
    setlocal tw=60 
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal foldtext=MarkdownFoldText()
    setlocal spell
    let b:table_mode_corner='+'
endfunction

function! AutoSave()
    silent! wa
endfunction

"" Status bar

hi! CustomFile cterm=bold gui=bold ctermfg=12 guifg=12 ctermbg=NONE guibg=NONE
hi! CustomPercentage cterm=bold gui=bold ctermfg=10 guifg=10 ctermbg=NONE guibg=NONE
hi! CustomLineCol cterm=bold gui=bold ctermfg=11 guifg=11 ctermbg=NONE guibg=NONE
hi! CustomFiletype cterm=bold gui=bold ctermfg=9 guifg=9 ctermbg=NONE guibg=NONE
hi! CustomGitBranch cterm=bold gui=bold ctermfg=13 guifg=13 ctermbg=NONE guibg=NONE
hi! CustomMode cterm=bold gui=bold ctermfg=14 guifg=14 ctermbg=NONE guibg=NONE
hi! Inactive cterm=italic gui=italic ctermfg=4 guifg=4 ctermbg=NONE guibg=NONE

let g:currentmode={
    \ 'n'  : 'n',
    \ 'no' : '.',
    \ 'v'  : 'v',
    \ 'V'  : 'vl',
    \ '^V' : 'vb',
    \ 's'  : 's',
    \ 'S'  : 'sl',
    \ '^S' : 'sb',
    \ 'i'  : 'i',
    \ 'R'  : 'r',
    \ 'Rv' : 'vr',
    \ 'c'  : '_',
    \ 'cv' : 'xv',
    \ 'ce' : 'x',
    \ 'r'  : 'p',
    \ 'rm' : 'm',
    \ 'r?' : '?',
    \ '!'  : '!',
    \ 't'  : 't'
    \ }

function! CurrentMode() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register. 3rd arg is
    " used when return of mode() == 0, which is the case with ^V.
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = tolower(get(g:currentmode, l:modecurrent, 'vb'))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

function! PasteMode()
    let paste_status = &paste
    if paste_status == 1
        return "paste"
    else
        return ""
    endif
endfunction

set laststatus=2
set noshowmode
set statusline=%!ActiveStatus()

function! LspCustomStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
    endif

    return ''
endfunction

function! ActiveStatus()
    let statusline="%="
    let statusline.="%#Inactive# ".LspCustomStatus()." "
    let statusline.="  %#CustomFile# %f %M %r"
    let statusline.="  %#CustomPercentage# %3p%%"
    let statusline.="  %#CustomLineCol# %3l:%3c"
    let statusline.="  %#CustomFiletype# ".tolower(&ft)
    let statusline.="  %#CustomGitBranch# "."%{fugitive#head()!=''?fugitive#head():''}"
    let statusline.="  %#CustomMode# %{CurrentMode()}\%-6{PasteMode()} "
    return statusline
endfunction

function! InactiveStatus()
    let statusline="%=%#Inactive#"
    let statusline.="  %f %M %r %3p%% "
    return statusline
endfunction

augroup status
    autocmd!
    autocmd BufEnter,WinEnter,BufRead,BufWinEnter * :setlocal statusline=%!ActiveStatus()
    autocmd BufLeave,WinLeave * :setlocal statusline=%!InactiveStatus()
augroup END

"" Tab line

fu! TabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999Xclose'
    endif

    return s
endfunction

fu! TabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return bufname(buflist[winnr - 1])
endfunction

hi TabLine cterm=bold ctermfg=1 guifg=1 ctermbg=NONE guibg=NONE
hi TabLineFill cterm=bold ctermfg=8 guifg=8 ctermbg=NONE guibg=NONE
hi TabLineSel cterm=bold ctermfg=15 guifg=15 ctermbg=NONE guibg=NONE

" sudo write
com! -bar W exe 'w !sudo tee >/dev/null %:p:S' | setl nomod

call sign_define("LspDiagnosticsErrorSign", {"text" : "X", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "!", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "i", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "?", "texthl" : "LspDiagnosticsHint"})
