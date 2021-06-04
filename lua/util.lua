local M = {}

local api = vim.api

M.Exists = function(variable)
    local loaded = api.nvim_call_function('exists', {variable})
    return loaded ~= 0
end

M.Has = function(variable)
    local loaded = api.nvim_call_function('has', {variable})
    return loaded ~= 0
end

M.Call = function(arg0, arg1)
    return api.nvim_call_function(arg0, arg1)
end

local SplitString = function(arg0,fileSeparator)
    local arg0Split = arg0:gmatch('[^'..fileSeparator..'%s]+')

    local pathTable = {}
    local i = 1

    for word in arg0Split do
        pathTable[i]=word
        i = i + 1
    end

    return pathTable, i
end

M.OnWindows = function()
    if M.Has("win32") or M.Has("win64") then
        return true
    else
        return false
    end
end

M.TrimmedDirectory = function(arg0)
    local home = ''
    local separator = ''

    if M.OnWindows() then
        fileSeparator = '\\'
        home = 'C'..os.getenv("HOMEPATH")
    else
        home = os.getenv("HOME")
        fileSeparator = '/'
    end

    local path = string.gsub(arg0,home,"~")

    if path=="~" then
        return path
    end

    local pathTable, pathTableSize = SplitString(path,fileSeparator)

    local ret=''

    for j=1,pathTableSize-1,1 do
        if j == 1 then
            ret=ret..pathTable[j]:sub(1,1)
        else
            ret=ret..fileSeparator
            if j==pathTableSize-1 then
                ret=ret..pathTable[j]
            else
                ret=ret..pathTable[j]:sub(1,1)
            end
        end
    end

    return ret
end

M.IsVersion5 = function()
    return api.nvim_call_function('has', {'nvim-0.5'}) == 1
end

return M

