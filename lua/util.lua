local M = {}

local api = vim.api

M.Exists = function(variable)
    local loaded = api.nvim_call_function('exists', {variable})
    return loaded ~= 0
end

M.Call = function(arg0, arg1)
    return api.nvim_call_function(arg0, arg1)
end

local SplitString = function(arg0)

    -- TODO Windows support
    local arg0Split = arg0:gmatch('[^/%s]+')

    local pathTable = {}
    local i = 1

    for word in arg0Split do
        pathTable[i]=word
        i = i + 1
    end

    return pathTable, i
end

M.TrimmedDirectory = function(arg0)
    local home = os.getenv("HOME")
    local path = string.gsub(arg0,home,"~")

    if path=="~" then
        return path
    end

    local pathTable, pathTableSize = SplitString(path)

    local ret=''

    for j=1,pathTableSize-1,1 do
        if j == 1 then
            ret=ret..pathTable[j]
        else
            ret=ret.."/"
            if j==pathTableSize then
                ret=ret..pathTable[j]
            else
                ret=ret..pathTable[j]
            end
        end
    end

    return ret
end

M.IsVersion5 = function()
    return api.nvim_call_function('has', {'nvim-0.5'}) == 1
end

return M

