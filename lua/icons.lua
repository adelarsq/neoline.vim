local M = {}

local util = require 'util'

M.GetIcon = function(file_name)
  if util.Exists('g:webdevicons_enable') then
      local icon = util.Call('WebDevIconsGetFileTypeSymbol', {file_name})
      return icon
  end
end

return M
