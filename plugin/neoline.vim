
if exists('g:neoline_loaded')
    finish
endif

let g:neoline_loaded = 1

function! ActiveLine(idbuffer) abort
    let ss = "require'status-line'.activeLine(" . a:idbuffer . ")"
    return luaeval(ss)
endfunction

" Notes:
" Based on https://github.com/itchyny/lightline.vim/blob/893bd90787abfec52a2543074e444fc6a9e0cf78/autoload/lightline.vim
function! InactiveLine(idbuffer) abort
    if &buftype ==# 'popup' | return | endif

    let w = winnr()
    for n in range(1, winnr('$'))
        if n!=w
            " Get buffer id for window number n
            let s:bufferId = winbufnr(n)
            " Get status line for the inactive window
            let ssI = "require'status-line'.inActiveLine(" . s:bufferId . ")"
            " Update the new status line
            call setwinvar(n, '&statusline', luaeval(ssI))
        endif
    endfor
endfunction

if !exists('g:neoline_disable_statusline')
    " Change statusline automatically
    if &laststatus == 3
lua << EOF
local timer = vim.loop.new_timer()

timer:start(100, 1000, vim.schedule_wrap(function()
  local bufnr = vim.api.nvim_get_current_buf()
  local ss = require'status-line'.activeLine(bufnr)
  vim.wo.statusline=ss
end))

EOF
    else 
        augroup NeoLine
          autocmd!
          autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine(bufnr('%'))
          autocmd WinEnter,BufEnter,WinLeave,BufLeave * call InactiveLine(bufnr('%'))
        augroup END
    endif
    
    if exists('g:neoline_winbar')
        augroup NeoLineWinBar
          autocmd!
          autocmd WinEnter,BufEnter * setlocal winbar=%F
        augroup END
    endif
endif

function! TabLine()
    return luaeval("require'status-line'.TabLine()")
endfunction

if !exists('g:neoline_disable_tabline')
    set tabline=%!TabLine()
endif

finish

