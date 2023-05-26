
local api = vim.api

local M = {}

M.abbreviate_path = function(path)
  if path == nil then
    return ''
  end
  
  local last_name = string.match(path, "[^/\\]+$")

  if last_name == nil then
    return ''
  end
  
  local previous_folders = string.match(path, "^.+[\\/]")

  local abbreviated_folders = ""
  for folder in string.gmatch(previous_folders, "[^/\\]+") do
    abbreviated_folders = abbreviated_folders .. string.sub(folder, 1, 1) .. "/"
  end

  return abbreviated_folders .. last_name
end

return M

