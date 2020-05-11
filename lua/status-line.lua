local api = vim.api
local icons = require 'devicon'
local session = require 'abduco'
local M = {}

session.abduco_session()

-- Different colors for mode
-- local red = '#BF616A'
-- local yellow = '#EBCB8B'
-- local green = '#A3BE8C'
-- local blue = '#81A1C1'
-- local purple = '#B48EAD'

local white = '#ffffff'
local red = '#ff4040'
local orange = '#ff9326'
local yellow = '#ffcb65'
local green = '#9ceb4f'
local aqua = '#18ffe0'
local blue = '#31baff'
local purple = '#9d8cff'

-- fg and bg
local white_fg = '#e6e6e6'
local black_fg = '#282c34'
local bg = '#4d4d4d'

-- Separators
local left_separator = ''
local right_separator = ''

-- Blank Between Components
local blank = ' '

-- Icons
local iconNERDTree = '🌳🌳🌳'
local iconVista = '📌'

------------------------------------------------------------------------
--                             StatusLine                             --
------------------------------------------------------------------------

-- Mode Prompt Table
local current_mode = setmetatable({
      ['n'] = 'NORMAL',
      ['no'] = 'N·Operator Pending',
      ['v'] = 'VISUAL',
      ['V'] = 'V·Line',
      ['^V'] = 'V·Block',
      ['s'] = 'Select',
      ['S'] = 'S·Line',
      ['^S'] = 'S·Block',
      ['i'] = 'INSERT',
      ['ic'] = 'INSERT',
      ['ix'] = 'INSERT',
      ['R'] = 'Replace',
      ['Rv'] = 'V·Replace',
      ['c'] = 'COMMAND',
      ['cv'] = 'Vim Ex',
      ['ce'] = 'Ex',
      ['r'] = 'Prompt',
      ['rm'] = 'More',
      ['r?'] = 'Confirm',
      ['!'] = 'Shell',
      ['t'] = 'TERMINAL'
    }, {
      -- fix weird issues
      __index = function(_, _)
        return 'V·Block'
      end
    }
)

-- Filename Color
local file_bg = purple
local file_fg = black_fg
local file_gui = 'bold'
api.nvim_command('hi NeoLineFile guibg='..file_bg..' guifg='..file_fg..' gui='..file_gui)
api.nvim_command('hi NeoLineFileSeparator guifg='..file_bg)

-- Working directory Color
local dir_bg = bg
local dir_fg = white_fg
local dir_gui = 'bold'
api.nvim_command('hi NeoLineNeoLineDirectory guibg='..dir_bg..' guifg='..dir_fg..' gui='..dir_gui)
api.nvim_command('hi NeoLineDirSeparator guifg='..dir_bg)

-- FileType Color
local filetype_bg = 'None'
local filetype_fg = blue
local filetype_gui = 'bold'
api.nvim_command('hi NeoLineFiletype guibg='..filetype_bg..' guifg='..filetype_fg..' gui='..filetype_gui)

-- VCS Color
local vcs_add = green
local vcs_delete = red
local vcs_change = orange
local vcs_fg = white
api.nvim_command('hi NeoLineVCSLeft guifg='..green)
api.nvim_command('hi NeoLineVCSAdd guibg='..green..' guifg='..vcs_fg)
api.nvim_command('hi NeoLineVCSDelete guibg='..red..' guifg='..vcs_fg)
api.nvim_command('hi NeoLineVCSChange guibg='..orange..' guifg='..vcs_fg)
api.nvim_command('hi NeoLineVCSRight guifg='..orange)

-- row and column Color
local line_bg = 'None'
local line_fg = white_fg
local line_gui = 'bold'
api.nvim_command('hi NeoLineLine guibg='..line_bg..' guifg='..line_fg..' gui='..line_gui)

-- Redraw different colors for different mode
local RedrawColors = function(mode)
  if mode == 'n' then
    api.nvim_command('hi NeoLineMode guibg='..green..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..green)
  end
  if mode == 'i' then
    api.nvim_command('hi NeoLineMode guibg='..blue..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..blue)
  end
  if mode == 'v' or mode == 'V' or mode == '^V' then
    api.nvim_command('hi NeoLineMode guibg='..purple..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..purple)
  end
  if mode == 'c' then
    api.nvim_command('hi NeoLineMode guibg='..yellow..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..yellow)
  end
  if mode == 't' then
    api.nvim_command('hi NeoLineMode guibg='..red..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..red)
  end
end

local TrimmedDirectory = function(dir)
  local home = os.getenv("HOME")
  local _, index = string.find(dir, home, 1)
  if index ~= nil and index ~= string.len(dir) then
    -- TODO Trimmed Home NeoLineDirectory
    return string.gsub(dir, home, '~')
  end
  return dir
end

function M.activeLine()
  local statusline = ""

  local filetype = api.nvim_buf_get_option(0, 'filetype')

  -- Icon For File
  if filetype == 'nerdtree' then
      statusline = statusline..iconNERDTree;
      return statusline
  elseif filetype == 'vista' then
      statusline = statusline..iconVista
      return statusline
  end

  -- Component: Mode
  local mode = api.nvim_get_mode()['mode']
  RedrawColors(mode)
  statusline = statusline.."%#NeoLineModeSeparator#"..left_separator.."%#NeoLineMode# "..current_mode[mode].." %#NeoLineModeSeparator#"..right_separator
  statusline = statusline..blank

  -- Component: Working Directory
  -- local dir = api.nvim_call_function('getcwd', {})
  -- statusline = statusline.."%#NeoLineDirSeparator#"..left_separator.."%#NeoLineDirectory# "..TrimmedDirectory(dir).." %#NeoLineDirSeparator#"..right_separator
  -- statusline = statusline..blank

  -- Repository Status
  local repostats = api.nvim_call_function('sy#repo#get_stats', {})
  if repostats[1] > -1 then
    statusline = statusline.."%#NeoLineVCSLeft#"
    statusline = statusline..left_separator
    statusline = statusline.."%#NeoLineVCSAdd#"
    statusline = statusline.."+"..repostats[1]
    statusline = statusline.."%#NeoLineVCSDelete#"
    statusline = statusline.."-"..repostats[2]
    statusline = statusline.."%#NeoLineVCSChange#"
    statusline = statusline.."~"..repostats[3]
    statusline = statusline.."%#NeoLineVCSRight#"
    statusline = statusline..right_separator
  end

  -- Alignment to left
  statusline = statusline.."%="

  -- Coc Status
  local cocstatus = api.nvim_call_function('coc#status', {})
  statusline = statusline..cocstatus

  -- Component: FileType
  statusline = statusline.."%#NeoLineFiletype# "..filetype
  statusline = statusline..blank

  -- Component: row and col
  local line = api.nvim_call_function('line', {"."})
  statusline = statusline.."%#NeoLineLine# Ln "..line

  return statusline
end

local InactiveLine_bg = '#4d4d4d'
local InactiveLine_fg = white_fg
api.nvim_command('hi NeoLineInActive guibg='..InactiveLine_bg..' guifg='..InactiveLine_fg)

function M.inActiveLine()
  local statusline = ""

  statusline = "%#NeoLineInActive# "

  -- local filetype = api.nvim_buf_get_option(0, 'filetype')
  -- Icon For File
  -- if filetype == 'nerdtree' then
      -- statusline = statusline..iconNERDTree
      -- return statusline
  -- elseif filetype == 'vista' then
      -- statusline = statusline..iconVista
      -- return statusline
  -- end

  local file_name = api.nvim_call_function('expand', {'%F'})
  statusline = statusline.."%#NeoLineInActive# "..file_name

  return statusline
end

------------------------------------------------------------------------
--                              TabLine                               --
------------------------------------------------------------------------

local getTabLabel = function(n)
  local current_win = api.nvim_tabpage_get_win(n)
  local current_buf = api.nvim_win_get_buf(current_win)
  local file_name = api.nvim_buf_get_name(current_buf)
  if string.find(file_name, 'term://') ~= nil then
    return ' '..api.nvim_call_function('fnamemodify', {file_name, ":p:t"})
  end
  file_name = api.nvim_call_function('fnamemodify', {file_name, ":p:t"})
  if file_name == '' then
    return "No Name"
  end
  local icon = icons.deviconTable[file_name]
  if icon ~= nil then
    return icon..' '..file_name
  end
  return file_name
end

api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..blue..' guifg=#292929')
api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..blue)
api.nvim_command('hi NeoLineTabLine guibg=#4d4d4d guifg=#c7c7c7 gui=None')
api.nvim_command('hi NeoLineTabLineSeparator guifg=#4d4d4d')
api.nvim_command('hi NeoLineTabLineFill guibg=None gui=None')


function M.TabLine()
  local tabline = ''
  local tab_list = api.nvim_list_tabpages()
  local current_tab = api.nvim_get_current_tabpage()
  for _, val in ipairs(tab_list) do
    local file_name = getTabLabel(val)
    if val == current_tab then
      tabline = tabline.."%#NeoLineTabLineSelSeparator# "..left_separator
      tabline = tabline.."%#NeoLineTabLineSel# "..file_name
      tabline = tabline.." %#NeoLineTabLineSelSeparator#"..right_separator
    else
      tabline = tabline.."%#NeoLineTabLineSeparator# "..left_separator
      tabline = tabline.."%#NeoLineTabLine# "..file_name
      tabline = tabline.." %#NeoLineTabLineSeparator#"..right_separator
    end
  end
  tabline = tabline.."%="
  if session.data ~= nil then
    tabline = tabline.."%#NeoLineTabLineSeparator# "..left_separator
    tabline = tabline.."%#NeoLineTabLine# session: "..session.data
    tabline = tabline.." %#NeoLineTabLineSeparator#"..right_separator
  end
  return tabline
end
return M


