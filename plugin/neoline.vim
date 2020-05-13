
function! ActiveLine()
    return luaeval("require'status-line'.activeLine()")
endfunction

" https://stackoverflow.com/questions/5215163/how-to-get-a-unique-identifier-for-a-window
" use 
"     let l:current_window = win_getid()
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
