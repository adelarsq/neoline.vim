local M = {}

local api = vim.api

M.Exists = function(variable)
    local loaded = api.nvim_call_function('exists', {variable})
    return loaded ~= 0
end

M.Call = function(arg0, arg1)
    return api.nvim_call_function(arg0, arg1)
end

M.TrimmedDirectory = function(arg0)
    -- local home = os.getenv("HOME")
    -- local _, index = string.find(dir, home, 1)
    -- if index ~= nil and index ~= string.len(dir) then
        -- return string.gsub(dir, home, '~')
    -- end

    return arg0
end

return M

