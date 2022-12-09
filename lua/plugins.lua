local api = vim.api

local M = {}

-- petertriho/nvim-scrollbar
M.ScrollColor = function(bgcolor)
    api.nvim_command('hi ScrollbarHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarCursorHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarCursor guibg='..bgcolor)
    api.nvim_command('hi ScrollbarSearchHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarErrorHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarWarnHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarInfoHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarHintHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarMiscHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarGitAddHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarGitChangeHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarGitDeleteHandle guibg='..bgcolor)
end

M.DebugStatus = function()
  local use, imported = pcall(require, "dap")
  if use then
    return imported.status()
  else
      return ''
  end
end

M.DebugControls = function()
  if M.DebugStatus() == '' then
    return ''
  end

  local use, imported = pcall(require, "dapui")
  if use then
    return imported.controls()
  else
      return ''
  end
end

return M

