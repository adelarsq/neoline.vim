
function! ActiveLine(idbuffer)
    let ss = "require'status-line'.activeLine(" . a:idbuffer . ")"
    return luaeval(ss)
endfunction

" https://stackoverflow.com/questions/5215163/how-to-get-a-unique-identifier-for-a-window
" use 
"     let l:current_window = win_getid()
function! InactiveLine(idbuffer)
    let ss = "require'status-line'.inActiveLine(" . a:idbuffer . ")"
    " let ss = "require'status-line'.inActiveLine()"
    return luaeval(ss)
endfunction

" Based on https://github.com/itchyny/lightline.vim/blob/893bd90787abfec52a2543074e444fc6a9e0cf78/autoload/lightline.vim
function! UpdateLine(idbuffer) abort
    if &buftype ==# 'popup' | return | endif

    let ssA = "require'status-line'.activeLine(" . a:idbuffer . ")"
    let ssI = "require'status-line'.inActiveLine(" . a:idbuffer . ")"

    let w = winnr()
    let s = winnr('$') == 1 && w > 0 ? [luaeval(ssA)] : [luaeval(ssA), luaeval(ssI)]
    for n in range(1, winnr('$'))
        call setwinvar(n, '&statusline', s[n!=w])
    endfor
endfunction

" Change statusline automatically
augroup NeoLine
  autocmd!
  " autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine(bufnr('%'))
  " autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine(bufnr('%'))
  autocmd WinEnter,BufEnter,BufDelete,SessionLoadPost,FileChangedShellPost * setlocal statusline=%!UpdateLine(bufnr('%'))
augroup END


function! TabLine()
    return luaeval("require'status-line'.TabLine()")
endfunction

set tabline=%!TabLine()
