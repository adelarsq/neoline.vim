
if exists('g:neoline_loaded')
    finish
endif

let g:neoline_loaded = 1

if !exists('g:neoline_disable_statusline')

lua << EOF
local timer = vim.uv.new_timer()

timer:start(100, 1000, vim.schedule_wrap(function()
  local bufnr = vim.api.nvim_get_current_buf()

  if vim.o.laststatus == 1 or vim.o.laststatus == 2 then
    vim.wo.statusline=require'status-line'.activeLine(bufnr)
    require'status-line'.UpdateInactiveWindows(bufnr)
  end

  if vim.o.laststatus == 3 then
    vim.wo.statusline=require'status-line'.activeLine(bufnr)
  end

  if vim.g.neoline_disable_tabline ~= 0 then
    vim.o.tabline=require'status-line'.TabLine()
  end
end))

EOF
    
    if exists('g:neoline_winbar')
        augroup NeoLineWinBar
          autocmd!
          autocmd WinEnter,BufEnter * setlocal winbar=%F
        augroup END
    endif
endif

finish

