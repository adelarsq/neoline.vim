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

return M

