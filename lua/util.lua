local M = {}

local api = vim.api

M.Exists = function(variable)
  local loaded = api.nvim_call_function('exists', {variable})
  return loaded ~= 0
end

M.Call = function(arg0, arg1)
  return api.nvim_call_function(arg0, arg1)
end

return M

