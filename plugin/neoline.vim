
function! ActiveLine()
    return luaeval("require'status-line'.activeLine()")
endfunction

function! InactiveLine()
    return luaeval("require'status-line'.inActiveLine()")
endfunction

" Change statusline automatically
augroup NeoLine
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END


function! TabLine()
    return luaeval("require'status-line'.TabLine()")
endfunction

set tabline=%!TabLine()
