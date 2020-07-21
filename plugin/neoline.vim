
if exists('g:neoline_loaded')
    finish
endif
let g:neoline_loaded = 1

function! ActiveLine(idbuffer) abort
    let ss = "require'status-line'.activeLine(" . a:idbuffer . ")"
    return luaeval(ss)
endfunction

" Notes:
" https://stackoverflow.com/questions/5215163/how-to-get-a-unique-identifier-for-a-window
" use 
"     let l:current_window = win_getid()
" Based on https://github.com/itchyny/lightline.vim/blob/893bd90787abfec52a2543074e444fc6a9e0cf78/autoload/lightline.vim
function! InactiveLine(idbuffer) abort
    if &buftype ==# 'popup' | return | endif

    let ssI = "require'status-line'.inActiveLine(" . a:idbuffer . ")"

    let w = winnr()
    for n in range(1, winnr('$'))
        if n!=w
            call setwinvar(n, '&statusline', luaeval(ssI))
        endif
    endfor
endfunction

" Change statusline automatically
augroup NeoLine
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine(bufnr('%'))
  autocmd WinEnter,BufEnter,WinLeave,BufLeave * call InactiveLine(bufnr('%'))
augroup END


function! TabLine()
    return luaeval("require'status-line'.TabLine()")
endfunction

set tabline=%!TabLine()
