local api = vim.api
local util = require 'util'
local icons = require 'icons'
local session = require 'abduco'
local M = {}

------------------------------------------------------------------------

session.abduco_session()

------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------

-- Different colors for mode
-- local red = '#BF616A'
-- local yellow = '#EBCB8B'
-- local green = '#A3BE8C'
-- local blue = '#81A1C1'
-- local purple = '#B48EAD'

local white = '#ffffff'
local red = '#ff5349' -- red orange
local orange = '#ff9326'
local yellow = '#fe6e00' -- blaze orange
local green = '#4CBB17' -- color Kelly
-- local green = '#55a630'
local turquoise = '#3FE0D0'
local aqua = '#18ffe0'
local blue = '#31baff'
-- local blue = '#3a86ff'
local purple = '#9d8cff'
local green_light = '#D5F5E3'
local purple_light = '#E8DAEF'
local blue_light = '#D6EAF8'
local red_light = '#FADBD8'

-- fg and bg
local white_fg = '#e6e6e6'
-- local black_fg = '#282c34'
-- local bg = '#4d4d4d'
local gray = '#cccccc'

------------------------------------------------------------------------
-- Components
------------------------------------------------------------------------

local normal_fg = gray
local normal_bg = white
local activeline_bg = blue
local activeline_fg = '#ffffff'
local inactiveline_bg = '#cccccc'
local inactiveline_fg = '#ffffff'

------------------------------------------------------------------------
-- Configs
------------------------------------------------------------------------

-- Separators
local left_separator = ''
local right_separator = ''
-- local left_separator = ' '
-- local right_separator = ' '
-- local left_separator = ' '
-- local right_separator = ' '
-- local left_separator = '░▒'
-- local right_separator = '▒░'
-- local left_separator = ''
-- local right_separator = ''

-- let s:separators = {
      -- \ 'arrow' : ["\ue0b0", "\ue0b2"],
      -- \ 'curve' : ["\ue0b4", "\ue0b6"],
      -- \ 'slant' : ["\ue0b8", "\ue0ba"],
      -- \ 'brace' : ["\ue0d2", "\ue0d4"],
      -- \ 'fire' : ["\ue0c0", "\ue0c2"],
-- call s:check_defined('g:airline_left_sep', "\ue0b0")      " 
-- call s:check_defined('g:airline_left_alt_sep', "\ue0b1")  " 
-- call s:check_defined('g:airline_right_sep', "\ue0b2")     " 
-- call s:check_defined('g:airline_right_alt_sep', "\ue0b3") " 

-- Blank Between Components
local blank = ' '

-- Icons
local iconVista = '📌 Vista'
local iconQf = '🐆 QF'
local iconShell = '🐚'
local iconDBUI = '🎲'
local iconDBUIOut = '🐬'
local iconDashboard = '🌅'
local iconUpdate = '🧙'
local iconVcs = '🐙'

-- Using NERDFonts
-- https://github.com/ryanoasis/powerline-extra-symbols
-- ro=, ws=☲, lnr=☰, mlnr=, br=, nx=Ɇ, crypt=🔒, dirty=⚡
local iconLn=''

------------------------------------------------------------------------
--                             StatusLine                             --
------------------------------------------------------------------------

-- Mode Prompt Table
local current_mode = setmetatable({
      ['n'] = 'NORMAL',
      ['no'] = 'N·Operator Pending',
      ['v'] = 'VISUAL',
      ['V'] = 'V·Line',
      [''] = 'V·Block',
      ['s'] = 'Select',
      ['S'] = 'S·Line',
      [''] = 'S·Block',
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
    }, {}
)

-- Initialize colors
function M.initColors()

    -- File changed
    api.nvim_command('hi NeoLineFileChanged guifg='..red..' guibg='..white)

    -- VCS Color
    local vcs_add = green
    local vcs_delete = red
    local vcs_change = orange
    local vcs_fg = white
    api.nvim_command('hi NeoLineVCSLeft guifg='..white..' guibg='..blue)
    api.nvim_command('hi NeoLineVCSLeft1 guifg='..blue..' guibg='..white)
    api.nvim_command('hi NeoLineVCSAdd guifg='..green..' guibg='..white)
    api.nvim_command('hi NeoLineVCSDelete guifg='..red..' guibg='..white)
    api.nvim_command('hi NeoLineVCSChange guifg='..orange..' guibg='..white)
    api.nvim_command('hi NeoLineVCSRight guifg='..white..' guibg='..blue)

    api.nvim_command('hi NeoLineDefault guifg='..white..' guibg='..blue)
    api.nvim_command('hi NeoLineDefaultInverse guifg='..blue..' guibg='..white)

    -- row and column Color
    local line_bg = 'None'
    local line_fg = white_fg
    local line_gui = 'bold'
    api.nvim_command('hi NeoLineLine guibg='..line_bg..' guifg='..line_fg..' gui='..line_gui)

    -- TabLine
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..blue..' guifg='..white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..blue)
    api.nvim_command('hi NeoLineTabLine guibg=#cccccc guifg=#ffffff gui=None')
    api.nvim_command('hi NeoLineTabLineSeparator guifg=#cccccc')
    api.nvim_command('hi NeoLineTabLineFill guibg=None gui=None')

    api.nvim_command('hi NeoLineActive guibg='..activeline_bg..' guifg='..activeline_fg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..activeline_fg..' guifg='..activeline_bg)
    api.nvim_command('hi NeoLineActiveInverseBegin guibg=none'..' guifg='..activeline_bg)
    api.nvim_command('hi NeoLineActiveInverseEnd guibg=none'..' guifg='..activeline_bg)

    api.nvim_command('hi NeoLineInActive guibg='..inactiveline_bg..' guifg='..inactiveline_fg)
    api.nvim_command('hi NeoLineInActiveInverse guibg='..inactiveline_fg..' guifg='..inactiveline_bg)
    api.nvim_command('hi NeoLineInActiveInverseBegin guibg=none'..' guifg='..inactiveline_bg)
    api.nvim_command('hi NeoLineInActiveInverseEnd guibg=none'..' guifg='..inactiveline_bg)

end

-- Redraw different colors for different mode
local RedrawColors = function(mode)
  if mode == 'n' then
    api.nvim_command('hi NeoLineMode guibg='..blue..' guifg='..normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..blue)
    api.nvim_command('hi NeoLineDefault guibg='..blue)
    -- api.nvim_command('hi CursorLine guibg='..blue_light)
    api.nvim_command('hi NeoLineActive guibg='..blue..' guifg='..normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..normal_bg..' guifg='..blue)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..blue..' guifg='..white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..blue)
  end
  if mode == 'i' then
    api.nvim_command('hi NeoLineMode guibg='..green..' guifg='..normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..green)
    api.nvim_command('hi NeoLineDefault guibg='..green)
    -- api.nvim_command('hi CursorLine guibg='..green_light)
    api.nvim_command('hi NeoLineActive guibg='..green..' guifg='..normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..normal_bg..' guifg='..green)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..green..' guifg='..white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..green)
  end
  if mode == 'v' or mode == 'V' or mode == '' then
    api.nvim_command('hi NeoLineMode guibg='..purple..' guifg='..normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..purple)
    api.nvim_command('hi NeoLineDefault guibg='..purple)
    api.nvim_command('hi Visual guibg='..purple_light)
    api.nvim_command('hi NeoLineActive guibg='..purple..' guifg='..normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..normal_bg..' guifg='..purple)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..purple..' guifg='..white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..purple)
  end
  if mode == 'c' then
    api.nvim_command('hi NeoLineMode guibg='..yellow..' guifg='..normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..yellow)
    api.nvim_command('hi NeoLineDefault guibg='..yellow)
    api.nvim_command('hi NeoLineActive guibg='..yellow..' guifg='..normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..normal_bg..' guifg='..yellow)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..yellow..' guifg='..white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..yellow)
  end
  if mode == 'Rv' then
    api.nvim_command('hi NeoLineMode guibg='..red..' guifg='..normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..red)
    api.nvim_command('hi NeoLineDefault guibg='..red)
    -- api.nvim_command('hi CursorLine guibg='..red_light)
    api.nvim_command('hi NeoLineActive guibg='..red..' guifg='..normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..normal_bg..' guifg='..red)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..red..' guifg='..white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..red)
  end
  if mode == 't' then
    api.nvim_command('hi NeoLineMode guibg='..turquoise..' guifg='..normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..turquoise)
    api.nvim_command('hi NeoLineDefault guibg='..turquoise)
    api.nvim_command('hi NeoLineActive guibg='..turquoise..' guifg='..normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..normal_bg..' guifg='..turquoise)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..turquoise..' guifg='..white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..turquoise)
  end
end

-- neoclide/coc.nvim
local CocStatus = function()
    local cocstatus = util.Call('coc#status', {})
    return cocstatus
end

-- Builtin Neovim LSP
local BuiltinLsp = function(idbuffer)
    local sl = ''

    if not util.IsVersion5() then
        return sl
    end

    sl = sl.."%#NeoLineDefault#"
    sl = sl..left_separator
    if not vim.tbl_isempty(vim.lsp.buf_get_clients(idbuffer)) then
        sl=sl.."%#NeoLineDefaultInverse#"
        sl=sl..'🔥'
        sl=sl..' E:'
        sl=sl..'%{luaeval("vim.lsp.diagnostic.get_count('..idbuffer..',[[Error]])")}'
        sl=sl..' W:'
        sl=sl..'%{luaeval("vim.lsp.diagnostic.get_count('..idbuffer..',[[Warning]])")}'
    else
        sl=sl..'%#NeoLineDefaultInverse#🧊'
    end
    sl = sl.."%#NeoLineDefault#"
    sl = sl..right_separator
    return sl 
end

local LspStatus = function(idbuffer)
    local sl = ''

    if util.Exists('g:did_coc_loaded') then
        sl=sl..CocStatus()
    else
        sl=sl..BuiltinLsp(idbuffer)
    end

    return sl
end

local TsStatus = function()

    if not util.IsVersion5() then
        return ''
    end

    if not util.Exists('g:loaded_nvim_treesitter') then
        return ''
    end

    local sl = "%#NeoLineDefault#"
    sl = sl..left_separator
    sl = sl.."%#NeoLineDefaultInverse#"
    
    local ts = util.Call('nvim_treesitter#statusline', {30})
    if ts == nil then
        return ''
    end
    sl = sl..ts

    sl = sl.."%#NeoLineDefault#"
    sl = sl..right_separator
    
    return sl
end

local NERDTreeStatus = function()
    local root_dir = ''

    local iconNERDTree = '🌳'
    local statusline = iconNERDTree
    statusline = statusline..' '

    if util.IsVersion5() then
        root_dir = vim.fn.eval('g:NERDTree.ForCurrentTab().getRoot().path.str()')
        if root_dir ~= nil then
            root_dir = util.TrimmedDirectory(root_dir)
        end
        statusline = statusline..root_dir
    else
        statusline = statusline..'NERDTree'
    end

    return statusline
end

local DebugStatus = function()
    if not util.Exists('g:nvim_dap') then
        return ''
    end

    return require('dap').status()
end

local CurrentScope = function()
    if util.Exists('g:did_coc_loaded') then
        return vim.fn.eval('b:coc_current_function')
    else
        return TsStatus()
    end
end

function M.activeLine(idbuffer)
  local statusline = "%#NeoLineDefault#"

  statusline = "%#NeoLineActiveInverseBegin#" .. left_separator
  statusline = statusline.."%#NeoLineActive#"

  local filetype = api.nvim_buf_get_option(idbuffer, 'filetype')

  -- Icon For File
  if filetype == 'nerdtree' or filetype == 'CHADTree' then
      statusline = statusline..NERDTreeStatus()
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. right_separator
      return statusline
  elseif filetype == 'dbui' then
      statusline = statusline..iconDBUI
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. right_separator
      return statusline
  elseif filetype == 'dbout' then
      statusline = statusline..iconDBUIOut
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. right_separator
      return statusline
  elseif filetype == 'dashboard' then
      statusline = statusline..iconDashboard
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. right_separator
      return statusline
  elseif filetype == 'git' or filetype == 'svn' then
      statusline = statusline..iconVcs
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. right_separator
      return statusline
  elseif filetype == 'vim-plug' then
      statusline = statusline..iconUpdate
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. right_separator
      return statusline
  elseif filetype == 'vista' or filetype == 'vista_kind' or filetype == 'vista_markdown' then
      statusline = statusline..iconVista
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. right_separator
      return statusline
  end

  -- Component: Mode
  local mode = api.nvim_get_mode()['mode']
  RedrawColors(mode)
  statusline = statusline.."%#NeoLineDefault#"..current_mode[mode].." %#NeoLineDefault#"
  statusline = statusline..blank

  statusline = statusline.."%#NeoLineVCSLeft#"
  statusline = statusline.."%#NeoLineDefault#"
  statusline = statusline..left_separator

  -- Repository Status
  -- if util.Exists('g:loaded_neovcs') then

      -- local vcsStatus = util.Call('VcsStatusLine', {})

      -- statusline = statusline.."%#NeoLineVCSChange#"
      -- statusline = statusline.." "..vcsStatus

  -- else
  if util.Exists('g:loaded_signify') then
      local repostats = util.Call('sy#repo#get_stats', {})

      if repostats[1] > -1 then
          statusline = statusline.."%#NeoLineVCSAdd#"
          statusline = statusline.."+"..repostats[1]
          statusline = statusline.."%#NeoLineVCSDelete#"
          statusline = statusline.."-"..repostats[2]
          statusline = statusline.."%#NeoLineVCSChange#"
          statusline = statusline.."~"..repostats[3]

          -- TODO verificar se plugin esta ativo
          local vcsName = util.Call('VcsName', {})
          statusline = statusline.." "..vcsName
      end
  end

  statusline = statusline.."%#NeoLineFileChanged#"
  statusline = statusline.."%{&modified?'+':''}"

  statusline = statusline.."%#NeoLineVCSRight#"
  statusline = statusline.."%#NeoLineDefault#"
  statusline = statusline..right_separator

  statusline = statusline.."%#NeoLineDefault#"
  statusline = statusline.."%="
  statusline = statusline.."%#NeoLineDefault#"

  local debugStatus = DebugStatus()
  if debugStatus == '' then
    statusline = statusline..CurrentScope()
  else
    statusline = statusline..debugStatus
  end

  -- Alignment to left
  statusline = statusline.."%#NeoLineDefault#"
  statusline = statusline.."%="
  statusline = statusline.."%#NeoLineDefault#"

  statusline = statusline..LspStatus(idbuffer)

  -- Component: FileType
  statusline = statusline.."%#NeoLineDefault# "..filetype
  statusline = statusline..blank

  -- Component: row and col
  local line = util.Call('line', {"."})
  local column = util.Call('col', {"."})
  statusline = statusline.."%#NeoLineDefault# %{&fileencoding} "..iconLn.." "..line..":"..column

  statusline = statusline.."%#NeoLineActiveInverseEnd#"..right_separator

  return statusline
end

function M.inActiveLine(idbuffer)
  local statusline = ""

  statusline = "%#NeoLineInActiveInverseBegin#" .. left_separator

  local filetype = api.nvim_buf_get_option(idbuffer, 'filetype')

  if filetype == 'nerdtree' or filetype == 'CHADTree' then
      statusline = statusline .. "%#NeoLineInActive#"..NERDTreeStatus()
  elseif filetype == 'dbui' then
      statusline = statusline .. "%#NeoLineInActive#"..iconDBUI
  elseif filetype == 'dbout' then
      statusline = statusline .. "%#NeoLineInActive#"..iconDBUIOut
  elseif filetype == 'dashboard' then
      statusline = statusline .. "%#NeoLineInActive#"..iconDashboard
  elseif filetype == 'git' or filetype == 'svn' then
      statusline = statusline .. "%#NeoLineInActive#"..iconVcs
  elseif filetype == 'vim-plug' then
      statusline = statusline .. "%#NeoLineInActive#"..iconUpdate
  elseif filetype == 'vista' or filetype == 'vista_kind' or filetype == 'vista_markdown'  then
      statusline = statusline .. "%#NeoLineInActive#"..iconVista
  else
      statusline = statusline .. "%#NeoLineInActive# %f"
      statusline = statusline .."%#NeoLineInActive# "
  end

  statusline = statusline .. "%="
  statusline = statusline .. "%#NeoLineInActiveInverseEnd#" .. right_separator

  return statusline
end

------------------------------------------------------------------------
--                              TabLine                               --
------------------------------------------------------------------------

local getTabLabel = function(n)
  local current_number = api.nvim_tabpage_get_number(n)
  local current_win = api.nvim_tabpage_get_win(n)
  local current_buf = api.nvim_win_get_buf(current_win)
  local file_name = api.nvim_buf_get_name(current_buf)
  if string.find(file_name, 'term://') ~= nil then
    return current_number..' '..iconShell..' '..util.Call('fnamemodify', {file_name, ":p:t"})
  end
  file_name = util.Call('fnamemodify', {file_name, ":p:t"})
  if file_name == '' then
    return current_number.." No Name"
  end
  local icon = icons.GetIcon(file_name)
  if icon ~= nil then
    return current_number..' '..icon..' '..file_name
  end
  return current_number..' '..file_name
end

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

M.initColors()

return M

