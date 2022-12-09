local M = {}

local util = require 'util'

M.Setup = function()
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
end

M.GetIcon = function(file_name)
  if util.Exists('g:webdevicons_enable') then
      local icon = util.Call('WebDevIconsGetFileTypeSymbol', {file_name})
      return icon
  end
end

return M
