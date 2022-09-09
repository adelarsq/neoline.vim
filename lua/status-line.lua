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
-- vim.g.neoline_red = '#BF616A'
-- vim.g.neoline_yellow = '#EBCB8B'
-- vim.g.neoline_green = '#A3BE8C'
-- vim.g.neoline_blue = '#81A1C1'
-- vim.g.neoline_purple = '#B48EAD'

vim.g.neoline_white = '#ffffff'
vim.g.neoline_red = '#ff5349' -- red orange
vim.g.neoline_orange = '#ff9326'
vim.g.neoline_yellow = '#fe6e00' -- blaze orange
vim.g.neoline_green = '#4CBB17' -- color Kelly
-- vim.g.neoline_green = '#55a630'
vim.g.neoline_turquoise = '#3FE0D0'
vim.g.neoline_aqua = '#18ffe0'
vim.g.neoline_blue = '#31baff'
-- vim.g.neoline_blue = '#3a86ff'
vim.g.neoline_purple = '#9d8cff'
vim.g.neoline_green_light = '#D5F5E3'
vim.g.neoline_purple_light = '#E8DAEF'
vim.g.neoline_blue_light = '#D6EAF8'
vim.g.neoline_red_light = '#FADBD8'

-- fg and bg
vim.g.neoline_white_fg = '#e6e6e6'
-- vim.g.neoline_black_fg = '#282c34'
-- vim.g.neoline_bg = '#4d4d4d'
vim.g.neoline_gray = '#cccccc'

------------------------------------------------------------------------
-- Components
------------------------------------------------------------------------

vim.g.neoline_normal_fg = vim.g.neoline_gray
vim.g.neoline_normal_bg = vim.g.neoline_white
vim.g.neoline_activeline_bg = vim.g.neoline_blue
vim.g.neoline_activeline_fg = '#ffffff'
vim.g.neoline_inactiveline_bg = '#cccccc'
vim.g.neoline_inactiveline_fg = '#ffffff'

------------------------------------------------------------------------
-- Configs
------------------------------------------------------------------------

-- Separators
if not vim.g.neoline_separator then
   vim.g.neoline_left_separator = ''
   vim.g.neoline_right_separator = ''
end

if vim.g.neoline_separator == 'fire' then
  vim.g.neoline_left_separator = ' '
  vim.g.neoline_right_separator = ' '
end

if vim.g.neoline_separator == 'dots1' then
 vim.g.neoline_left_separator = ' '
 vim.g.neoline_right_separator = ' '
end

if vim.g.neoline_separator == 'dots2' then
 vim.g.neoline_left_separator = '░▒'
 vim.g.neoline_right_separator = '▒░'
end

if vim.g.neoline_separator == 'triangle' then
vim.g.neoline_right_separator = ''
vim.g.neoline_right_separator_alt = ''
vim.g.neoline_left_separator = ''
vim.g.neoline_left_separator_alt = ''
end

if vim.g.neoline_separator == 'empty' then
 vim.g.neoline_left_separator = ''
 vim.g.neoline_right_separator = ''
end

-- Space between components
vim.g.neoline_blank = ' '

-- Icons

vim.g.neoline_iconCwd = '🏡'

vim.g.neoline_iconOutline = '📌 Outline'
vim.g.neoline_iconQf = '🐆 QF'
vim.g.neoline_iconShell = '🐚'
vim.g.neoline_iconDBUI = '🎲'
vim.g.neoline_iconDBUIOut = '🐬'
vim.g.neoline_iconDashboard = '🌅'
vim.g.neoline_iconUpdate = '🧙'
vim.g.neoline_iconVcs = '🐙'
vim.g.neoline_iconTerminal = '🐚'
vim.g.neoline_iconTrouble = '💩'
vim.g.neoline_iconHelp = '💡 help'

-- Using NERDFonts
-- https://github.com/ryanoasis/powerline-extra-symbols
-- ro=, ws=☲, lnr=☰, mlnr=, br=, nx=Ɇ, crypt=🔒, dirty=⚡
vim.g.neoline_iconLn=''

-- LSP
vim.g.neoline_lsp_stoped='🧊'

if not vim.g.neoline_symbol_error then
   -- vim.g.neoline_symbol_error = '💥'
   vim.g.neoline_symbol_error = 'e'
end
if not vim.g.neoline_symbol_warning then
   -- vim.g.neoline_symbol_warning = '💩'
   vim.g.neoline_symbol_warning = 'w'
end
if not vim.g.neoline_symbol_information then
   -- vim.g.neoline_symbol_information = '⚠️'
   vim.g.neoline_symbol_information = 'i'
end
if not vim.g.neoline_symbol_hint then
   -- vim.g.neoline_symbol_hint = '💡'
   vim.g.neoline_symbol_hint = 'h'
end

-- File tree
if not vim.g.neoline_iconTree then
   vim.g.neoline_iconTree = '🌳'
end

------------------------------------------------------------------------
--                             StatusLine                             --
------------------------------------------------------------------------

-- Mode Prompt Table
local current_mode = setmetatable({
      [''] = 'V·Block',
      [''] = 'S·Block',
      ['n'] = 'N',
      ['no'] = 'O',
      ['nov'] = 'O',
      ['noV'] = 'O',
      ['no'] = 'O',
      ['niI'] = 'N',
      ['niR'] = 'N',
      ['niV'] = 'N',
      ['nt'] = 'N',
      ['v'] = 'V',
      ['vs'] = 'V',
      ['V'] = 'V',
      ['Vs'] = 'V',
      [''] = 'V',
      ['s'] = 'V',
      ['s'] = 'S',
      ['S'] = 'S',
      [''] = 'S',
      ['i'] = 'I',
      ['ic'] = 'I',
      ['ix'] = 'I',
      ['R'] = 'R',
      ['Rc'] = 'R',
      ['Rx'] = 'R',
      ['Rv'] = 'R',
      ['Rvc'] = 'R',
      ['Rvx'] = 'R',
      ['c'] = 'C',
      ['cv'] = 'EX',
      ['ce'] = 'EX',
      ['r'] = 'R',
      ['rm'] = 'M',
      ['r?'] = 'C',
      ['!'] = 'S',
      ['t'] = 'T',
    }, {}
)

-- Initialize colors
function M.initColors()

    -- File changed
    api.nvim_command('hi NeoLineFileChanged guifg='..vim.g.neoline_red..' guibg='..vim.g.neoline_white)

    -- VCS Color
    local vcs_add = green
    local vcs_delete = red
    local vcs_change = orange
    local vcs_fg = white
    api.nvim_command('hi NeoLineVCSLeft guifg='..vim.g.neoline_white..' guibg='..vim.g.neoline_blue)
    api.nvim_command('hi NeoLineVCSLeft1 guifg='..vim.g.neoline_blue..' guibg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineVCSAdd guifg='..vim.g.neoline_green..' guibg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineVCSDelete guifg='..vim.g.neoline_red..' guibg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineVCSChange guifg='..vim.g.neoline_orange..' guibg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineVCSRight guifg='..vim.g.neoline_white..' guibg='..vim.g.neoline_blue)

    api.nvim_command('hi NeoLineDefault guifg='..vim.g.neoline_white..' guibg='..vim.g.neoline_blue)
    api.nvim_command('hi NeoLineDefaultInverse guifg='..vim.g.neoline_blue..' guibg='..vim.g.neoline_white)

    -- row and column Color
    local line_bg = 'None'
    local line_fg = vim.g.neoline_white_fg
    local line_gui = 'bold'
    api.nvim_command('hi NeoLineLine guibg='..line_bg..' guifg='..line_fg..' gui='..line_gui)

    -- TabLine
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..vim.g.neoline_blue..' guifg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..vim.g.neoline_blue)
    api.nvim_command('hi NeoLineTabLine guibg=#cccccc guifg=#ffffff gui=None')
    api.nvim_command('hi NeoLineTabLineSeparator guifg=#cccccc')
    api.nvim_command('hi NeoLineTabLineFill guibg=None gui=None')

    api.nvim_command('hi NeoLineActive guibg='..vim.g.neoline_activeline_bg..' guifg='..vim.g.neoline_activeline_fg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..vim.g.neoline_activeline_fg..' guifg='..vim.g.neoline_activeline_bg)
    api.nvim_command('hi NeoLineActiveInverseBegin guibg=none'..' guifg='..vim.g.neoline_activeline_bg)
    api.nvim_command('hi NeoLineActiveInverseEnd guibg=none'..' guifg='..vim.g.neoline_activeline_bg)

    api.nvim_command('hi NeoLineInActive guibg='..vim.g.neoline_inactiveline_bg..' guifg='..vim.g.neoline_inactiveline_fg)
    api.nvim_command('hi NeoLineInActiveInverse guibg='..vim.g.neoline_inactiveline_fg..' guifg='..vim.g.neoline_inactiveline_bg)
    api.nvim_command('hi NeoLineInActiveInverseBegin guibg=none'..' guifg='..vim.g.neoline_inactiveline_bg)
    api.nvim_command('hi NeoLineInActiveInverseEnd guibg=none'..' guifg='..vim.g.neoline_inactiveline_bg)

end

-- petertriho/nvim-scrollbar
local ScrollColor = function(bgcolor)
    api.nvim_command('hi ScrollbarHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarSearchHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarErrorHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarWarnHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarInfoHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarHintHandle guibg='..bgcolor)
    api.nvim_command('hi ScrollbarMiscHandle guibg='..bgcolor)
end

-- Redraw different colors for different mode
local RedrawColors = function(mode)
  if mode == 'n' then
    api.nvim_command('hi NeoLineMode guibg='..vim.g.neoline_blue..' guifg='..vim.g.neoline_normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..vim.g.neoline_blue)
    api.nvim_command('hi NeoLineDefault guibg='..vim.g.neoline_blue)
    -- api.nvim_command('hi CursorLine guibg='..vim.g.neoline_blue_light)
    api.nvim_command('hi NeoLineActive guibg='..vim.g.neoline_blue..' guifg='..vim.g.neoline_normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..vim.g.neoline_normal_bg..' guifg='..vim.g.neoline_blue)
    api.nvim_command('hi NeoLineActiveInverseBegin guibg=none'..' guifg='..vim.g.neoline_blue)
    api.nvim_command('hi NeoLineActiveInverseEnd guibg=none'..' guifg='..vim.g.neoline_blue)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..vim.g.neoline_blue..' guifg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..vim.g.neoline_blue)

    ScrollColor(vim.g.neoline_blue)
  elseif mode == 'i' then
    api.nvim_command('hi NeoLineMode guibg='..vim.g.neoline_green..' guifg='..vim.g.neoline_normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..vim.g.neoline_green)
    api.nvim_command('hi NeoLineDefault guibg='..vim.g.neoline_green)
    -- api.nvim_command('hi CursorLine guibg='..vim.g.neoline_green_light)
    api.nvim_command('hi NeoLineActive guibg='..vim.g.neoline_green..' guifg='..vim.g.neoline_normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..vim.g.neoline_normal_bg..' guifg='..vim.g.neoline_green)
    api.nvim_command('hi NeoLineActiveInverseBegin guibg=none'..' guifg='..vim.g.neoline_green)
    api.nvim_command('hi NeoLineActiveInverseEnd guibg=none'..' guifg='..vim.g.neoline_green)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..vim.g.neoline_green..' guifg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..vim.g.neoline_green)

    ScrollColor(vim.g.neoline_green)
  elseif mode == 'v' or mode == 'V' or mode == '' then
    api.nvim_command('hi NeoLineMode guibg='..vim.g.neoline_purple..' guifg='..vim.g.neoline_normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..vim.g.neoline_purple)
    api.nvim_command('hi NeoLineDefault guibg='..vim.g.neoline_purple)
    api.nvim_command('hi Visual guibg='..vim.g.neoline_purple_light)
    api.nvim_command('hi NeoLineActive guibg='..vim.g.neoline_purple..' guifg='..vim.g.neoline_normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..vim.g.neoline_normal_bg..' guifg='..vim.g.neoline_purple)
    api.nvim_command('hi NeoLineActiveInverseBegin guibg=none'..' guifg='..vim.g.neoline_purple)
    api.nvim_command('hi NeoLineActiveInverseEnd guibg=none'..' guifg='..vim.g.neoline_purple)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..vim.g.neoline_purple..' guifg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..vim.g.neoline_purple)

    ScrollColor(vim.g.neoline_purple)
  elseif mode == 'c' then
    api.nvim_command('hi NeoLineMode guibg='..vim.g.neoline_yellow..' guifg='..vim.g.neoline_normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..vim.g.neoline_yellow)
    api.nvim_command('hi NeoLineDefault guibg='..vim.g.neoline_yellow)
    api.nvim_command('hi NeoLineActive guibg='..vim.g.neoline_yellow..' guifg='..vim.g.neoline_normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..vim.g.neoline_normal_bg..' guifg='..vim.g.neoline_yellow)
    api.nvim_command('hi NeoLineActiveInverseBegin guibg=none'..' guifg='..vim.g.neoline_yellow)
    api.nvim_command('hi NeoLineActiveInverseEnd guibg=none'..' guifg='..vim.g.neoline_yellow)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..vim.g.neoline_yellow..' guifg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..vim.g.neoline_yellow)

    ScrollColor(vim.g.neoline_yellow)
  elseif mode == 'Rv' then
    api.nvim_command('hi NeoLineMode guibg='..vim.g.neoline_red..' guifg='..vim.g.neoline_normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..vim.g.neoline_red)
    api.nvim_command('hi NeoLineDefault guibg='..vim.g.neoline_red)
    -- api.nvim_command('hi CursorLine guibg='..vim.g.neoline_red_light)
    api.nvim_command('hi NeoLineActive guibg='..vim.g.neoline_red..' guifg='..vim.g.neoline_normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..vim.g.neoline_normal_bg..' guifg='..vim.g.neoline_red)
    api.nvim_command('hi NeoLineActiveInverseBegin guibg=none'..' guifg='..vim.g.neoline_red)
    api.nvim_command('hi NeoLineActiveInverseEnd guibg=none'..' guifg='..vim.g.neoline_red)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..vim.g.neoline_red..' guifg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..vim.g.neoline_red)

    ScrollColor(vim.g.neoline_red)
  elseif mode == 't' then
    api.nvim_command('hi NeoLineMode guibg='..vim.g.neoline_turquoise..' guifg='..vim.g.neoline_normal_fg..' gui=bold')
    api.nvim_command('hi NeoLineModeSeparator guifg='..vim.g.neoline_turquoise)
    api.nvim_command('hi NeoLineDefault guibg='..vim.g.neoline_turquoise)
    api.nvim_command('hi NeoLineActive guibg='..vim.g.neoline_turquoise..' guifg='..vim.g.neoline_normal_bg)
    api.nvim_command('hi NeoLineActiveInverse guibg='..vim.g.neoline_normal_bg..' guifg='..vim.g.neoline_turquoise)
    api.nvim_command('hi NeoLineActiveInverseBegin guibg=none'..' guifg='..vim.g.neoline_turquoise)
    api.nvim_command('hi NeoLineActiveInverseEnd guibg=none'..' guifg='..vim.g.neoline_turquoise)
    api.nvim_command('hi NeoLineTabLineSel gui=Bold guibg='..vim.g.neoline_turquoise..' guifg='..vim.g.neoline_white)
    api.nvim_command('hi NeoLineTabLineSelSeparator gui=bold guifg='..vim.g.neoline_turquoise)

    ScrollColor(vim.g.neoline_turquoise)
  end
end

-- neoclide/coc.nvim
local CocStatus = function()
    local cocstatus = util.Call('coc#status', {})
    return cocstatus
end

local NeoDiagnosticStatus = function(idBuffer)
    local diagnostics = vim.diagnostic.get(idBuffer)
    local count = { 0, 0, 0, 0 }
    for _, diagnostic in ipairs(diagnostics) do
        count[diagnostic.severity] = count[diagnostic.severity] + 1
    end
    return count[vim.diagnostic.severity.ERROR],
           count[vim.diagnostic.severity.WARN],
           count[vim.diagnostic.severity.INFO],
           count[vim.diagnostic.severity.HINT]
end

-- Builtin Neovim LSP
local BuiltinLsp = function(idBuffer)
    local sl = ''

    if not util.IsVersion5() then
        return sl
    end

    sl = sl.."%#NeoLineDefault#"
    sl = sl..vim.g.neoline_left_separator
    if not vim.tbl_isempty(vim.lsp.buf_get_clients(idBuffer)) then local error, warning, information, hint = NeoDiagnosticStatus(idBuffer)

        sl=sl.."%#NeoLineDefaultInverse#"
        sl=sl..'🔥'
        if error > 0 then
            sl=sl..' '..vim.g.neoline_symbol_error
            sl=sl..error
        end
        if warning > 0 then
            sl=sl..' '..vim.g.neoline_symbol_warning
            sl=sl..warning
        end
        if information > 0 then
            sl=sl..' '..vim.g.neoline_symbol_information
            sl=sl..information
        end
        if hint > 0 then
            sl=sl..' '..vim.g.neoline_symbol_hint
            sl=sl..hint
        end
    else
        sl=sl..'%#NeoLineDefaultInverse#'..vim.g.neoline_lsp_stoped
    end
    sl = sl.."%#NeoLineDefault#"
    sl = sl..vim.g.neoline_right_separator
    return sl 
end

local LspStatus = function(idBuffer)
    local sl = ''

    if vim.g.did_coc_loaded then
        sl=sl..CocStatus()
    else
        sl=sl..BuiltinLsp(idBuffer)
    end

    return sl
end

local TsStatus = function()
    if vim.g.loaded_nvim_treesitter then
      local use, imported = pcall(require, "nvim-treesitter.statusline")
      if use then
        return imported.statusline()
      else
        return ''
      end
    end
    return ''
end

local TreeStatus = function(idBuffer)
    local statusline = vim.g.neoline_iconTree
    statusline = statusline..' '
    if filetype == 'nerdtree' then
        if util.IsVersion5() then
            root_dir = vim.fn.eval('g:NERDTree.ForCurrentTab().getRoot().path.str()')
            if root_dir ~= nil then
                root_dir = util.TrimmedDirectory(root_dir)
            end
            statusline = statusline..root_dir
        else
            statusline = statusline..'NERDTree'
        end
    else
        -- nothing for now
    end
    return statusline
end

local FilePath = function(n)
    -- local root_dir = ''
    -- local current_buf = api.nvim_win_get_buf(n)
    -- local file_name = api.nvim_buf_get_name(current_buf)

    -- if util.IsVersion5() then
        -- root_dir = vim.fn.eval('g:NERDTree.ForCurrentTab().getRoot().path.str()')
        -- if root_dir ~= nil then
            -- root_dir = util.TrimmedDirectory(root_dir)
        -- end
        -- return root_dir..'/'..file_name
    -- else
        return '%f'
    -- end
end

local DebugStatus = function()
  local use, imported = pcall(require, "dap")
  if use then
    return imported.status()
  else
      return ''
  end
end

local CurrentScope = function()
    if vim.g.loaded_nvim_treesitter then
        return TsStatus()
    elseif vim.g.did_coc_loaded then
        return vim.fn.eval('b:coc_current_function')
    end
    return ''
end

local RunStatus = function()
    if vim.g.asyncrun_status then
        local result = vim.g.asyncrun_status
        if result ~= nil then
            return result
        end
    end
    return ''
end

local DebugStatusLine = function(filetype)
  if filetype == 'dapui_watches' then
      return " Watches"
  elseif filetype == 'dapui_stacks' then
      return " Stacks"
  elseif filetype == 'dapui_breakpoints' then
      return " Breackpoints"
  elseif filetype == 'dapui_scopes' then
      return " Scopes"
  elseif filetype == 'dap-repl' then
      return "ﲵ Repl"
  elseif filetype == 'dapui_console' then
      return " Console"
  else
      return ' '
  end
end

function M.activeLine(idBuffer)
  local statusline = "%#NeoLineDefault#"

  statusline = "%#NeoLineActiveInverseBegin#" .. vim.g.neoline_left_separator
  statusline = statusline.."%#NeoLineActive#"

  local filetype = api.nvim_buf_get_option(idBuffer, 'filetype')
  local laststatus = api.nvim_get_option('laststatus')

  -- Icon For File
  if filetype == 'nerdtree' or filetype == 'CHADTree' or filetype == 'NvimTree' or filetype == 'neo-tree'  then
      statusline = statusline .. TreeStatus(idBuffer)
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  elseif filetype == 'dbui' then
      statusline = statusline .. vim.g.neoline_iconDBUI
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  elseif filetype == 'dbout' then
      statusline = statusline .. vim.g.neoline_iconDBUIOut
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  elseif filetype == 'dashboard' then
      statusline = statusline .. vim.g.neoline_iconDashboard
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  elseif filetype == 'git' or filetype == 'svn' then
      statusline = statusline .. vim.g.neoline_iconVcs
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  elseif filetype == 'vim-plug' then
      statusline = statusline .. vim.g.neoline_iconUpdate
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  elseif filetype == 'Trouble' then
      statusline = statusline .. vim.g.neoline_iconTrouble
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  elseif filetype == 'floaterm' or filetype == 'nuake' then
      statusline = statusline .. vim.g.neoline_iconTerminal
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  elseif filetype == 'help' then
      statusline = statusline .. vim.g.neoline_iconHelp
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  elseif filetype == 'vista' or filetype == 'vista_kind' or filetype == 'vista_markdown' or filetype == 'flutterToolsOutline' then
      statusline = statusline ..vim.g.neoline_iconOutline
      -- statusline = statusline .. vim.fn.eval('vista#statusline#()')
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  elseif filetype == 'dapui_watches' or
         filetype == 'dapui_stacks' or
         filetype == 'dapui_breakpoints' or
         filetype == 'dapui_scopes' or
         filetype == 'dap-repl' or
         filetype == 'dapui_console' then
      statusline = statusline .. DebugStatusLine(filetype)
      statusline = statusline .. "%="
      statusline = statusline .. "%#NeoLineActiveInverseEnd#" .. vim.g.neoline_right_separator
      return statusline
  end

  -- Component: Mode
  local mode = api.nvim_get_mode()['mode']
  RedrawColors(mode)
  statusline = statusline.."%#NeoLineDefault#"..current_mode[mode]
  statusline = statusline.."%#NeoLineDefault#"
  statusline = statusline..vim.g.neoline_blank

  statusline = statusline.."%#NeoLineVCSLeft#"
  statusline = statusline.."%#NeoLineDefault#"
  statusline = statusline..vim.g.neoline_left_separator

  -- Repository Status
  -- if vim.g.loaded_neovcs then
      -- local vcsStatus = util.Call('VcsStatusLine', {})
      -- statusline = statusline.."%#NeoLineVCSChange#"
      -- statusline = statusline.." "..vcsStatus
  -- else
  -- TODO move this on another module
  if vim.g.loaded_signify then
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
          statusline = statusline .. vim.g.neoline_blank .. vcsName
      end
  end

  -- TODO move this on another module
  if util.Exists('b:gitsigns_head') then
    statusline = statusline.."%#NeoLineVCSAdd#"
    statusline = statusline .. vim.b.gitsigns_status .. ' ' .. vim.b.gitsigns_head
  end

  statusline = statusline.."%#NeoLineFileChanged#"
  statusline = statusline.."%{&modified?'+':''}"

  statusline = statusline.."%#NeoLineVCSRight#"
  statusline = statusline.."%#NeoLineDefault#"
  statusline = statusline..vim.g.neoline_right_separator

  statusline = statusline.."%#NeoLineDefault#"
  statusline = statusline.."%="
  statusline = statusline.."%#NeoLineDefault#"

  statusline = statusline..DebugStatus()

  local currentScope = CurrentScope()
  if currentScope then
    statusline = statusline..currentScope
  end

  -- Alignment to left
  statusline = statusline.."%#NeoLineDefault#"
  statusline = statusline.."%="
  statusline = statusline.."%#NeoLineDefault#"

  statusline = statusline..RunStatus()
  statusline = statusline..LspStatus(idBuffer)

  -- Component: FileType
  statusline = statusline.."%#NeoLineDefault# "..filetype
  statusline = statusline..vim.g.neoline_blank

  -- Component: row and col
  local line = util.Call('line', {"."})
  local column = util.Call('col', {"."})
  statusline = statusline.."%#NeoLineDefault#%{&fileencoding} "
  statusline = statusline..vim.g.neoline_iconLn
  statusline = statusline..vim.g.neoline_blank
  statusline = statusline..line..":"..column

  statusline = statusline.."%#NeoLineActiveInverseEnd#"..vim.g.neoline_right_separator

  return statusline
end

function M.inActiveLine(idBuffer)
  local statusline = ""

  statusline = "%#Normal#" .. " "

  local filetype = api.nvim_buf_get_option(idBuffer, 'filetype')

  if filetype == 'nerdtree' or filetype == 'CHADTree' or filetype == 'NvimTree' or filetype == 'neo-tree' then
      statusline = statusline .. "%#Normal#"..TreeStatus()
  elseif filetype == 'dbui' then
      statusline = statusline .. "%#Normal#"..vim.g.neoline_iconDBUI
  elseif filetype == 'dbout' then
      statusline = statusline .. "%#Normal#"..vim.g.neoline_iconDBUIOut
  elseif filetype == 'dashboard' then
      statusline = statusline .. "%#Normal#"..vim.g.neoline_iconDashboard
  elseif filetype == 'git' or filetype == 'svn' then
      statusline = statusline .. "%#Normal#"..vim.g.neoline_iconVcs
  elseif filetype == 'vim-plug' then
      statusline = statusline .. "%#Normal#"..vim.g.neoline_iconUpdate
  elseif filetype == 'Trouble' then
      statusline = statusline .. "%#Normal#"..vim.g.neoline_iconTrouble
  elseif filetype == 'help' then
      statusline = statusline .. "%#Normal#"..vim.g.neoline_iconHelp
  elseif filetype == 'vista' or filetype == 'vista_kind' or filetype == 'vista_markdown'  then
      statusline = statusline .. "%#Normal#"..vim.g.neoline_iconOutline
      -- statusline = statusline .. vim.fn.eval('vista#statusline#()')
  elseif filetype == 'dapui_watches' or
         filetype == 'dapui_stacks' or
         filetype == 'dapui_breakpoints' or
         filetype == 'dapui_scopes' or
         filetype == 'dap-repl' or
         filetype == 'dapui_console' then
      statusline = statusline .. "%#Normal#"..DebugStatusLine(filetype)
  else
      statusline = statusline .. "%#Normal# "..FilePath(idBuffer)
  end

  statusline = statusline .. "%="
  statusline = statusline .. "%#Normal#" .. " "

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
    return current_number..' '..vim.g.neoline_iconShell..' '..util.Call('fnamemodify', {file_name, ":p:t"})
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
      tabline = tabline.."%#NeoLineTabLineSelSeparator# "..vim.g.neoline_left_separator
      tabline = tabline.."%#NeoLineTabLineSel# "..file_name
      tabline = tabline.." %#NeoLineTabLineSelSeparator#"..vim.g.neoline_right_separator
    else
      tabline = tabline.."%#Normal# ".." "
      tabline = tabline.."%#Normal# "..file_name
      tabline = tabline.." %#Normal#".." "
    end
  end
  tabline = tabline.."%="

  if session.data ~= nil then
    tabline = tabline.."%#NeoLineTabLineSelSeparator# "..vim.g.neoline_left_separator
    tabline = tabline.."%#NeoLineTabLineSel# session: "..session.data
    tabline = tabline.." %#NeoLineTabLineSelSeparator#"..vim.g.neoline_right_separator
  end

  tabline = tabline.."%#NeoLineTabLineSelSeparator# "..vim.g.neoline_left_separator
  tabline = tabline.."%#NeoLineTabLineSel# "..vim.g.neoline_iconCwd..' '..vim.loop.cwd()
  tabline = tabline.." %#NeoLineTabLineSelSeparator#"..vim.g.neoline_right_separator

  return tabline
end

M.initColors()

return M
