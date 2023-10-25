local api = vim.api

local M = {}

M.TsStatus = function()
    if vim.g.neoline_enable_plugins then
        if vim.g.loaded_nvim_treesitter then
            local use, imported = pcall(require, "nvim-treesitter.statusline")
            if use then
                return imported.statusline()
            else
                return ''
            end
        end
        return ''
    else
        return ''
    end
end

M.CurrentScope = function()
    if vim.g.neoline_enable_plugins then
        if vim.g.loaded_nvim_treesitter then
            return M.TsStatus()
        elseif vim.g.did_coc_loaded then
            local result = vim.b.coc_current_function
            if result ~= nil then
                return result
            end
        end
        return ''
    else
        return ''
    end
end

-- petertriho/nvim-scrollbar
M.ScrollColor = function(bgcolor)
    api.nvim_command('hi ScrollbarHandle guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarCursorHandle guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarCursor guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarSearchHandle guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarErrorHandle guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarWarnHandle guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarInfoHandle guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarHintHandle guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarMiscHandle guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarGitAddHandle guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarGitChangeHandle guibg=' .. bgcolor)
    api.nvim_command('hi ScrollbarGitDeleteHandle guibg=' .. bgcolor)
end

M.DebugStatus = function()
    if vim.g.neoline_enable_plugins then
        local use, imported = pcall(require, "dap")
        if use then
            return imported.status()
        else
            return ''
        end
    else
        return ''
    end
end

M.DebugControls = function()
    if vim.g.neoline_enable_plugins then
        if M.DebugStatus() == '' then
            return ''
        end

        local use, imported = pcall(require, "dapui.controls")
        if use then
            return imported.controls()
        else
            return ''
        end
    else
        return ''
    end
end

return M
