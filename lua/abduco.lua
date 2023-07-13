local M = {}
local vim = vim
local uv = vim.uv
local api = vim.api

M.items = {}

local function onread(err, data)
  if err then
    -- print('ERROR: ', err)
    -- TODO handle err
  end
  if data then
    local vals = vim.split(data, "\n")
    for _, val in ipairs(vals) do
      if #val ~= 0 then
        table.insert(M.items, val)
        data = vim.split(val, "\t")
        if data[1]:sub(1, 1) == '*' then
          M.data = data[#data]
        end
      end
    end
  end
end

M.abduco_session = function()
  local stdout = vim.uv.new_pipe(false)
  local stderr = vim.uv.new_pipe(false)
  local handle, pid
  handle, pid = vim.uv.spawn('abduco', {
    args = {},
    stdio = {stdout,stderr}
    },
    vim.schedule_wrap(function()
      stdout:read_stop()
      stderr:read_stop()
      stdout:close()
      stderr:close()
      handle:close()
    end
    ))
  vim.uv.read_start(stdout, onread)
  vim.uv.read_start(stderr, onread)
end

return M
