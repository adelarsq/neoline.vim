local M = {}

M.Setup = function()
    vim.g.neoline_white = '#ffffff'
    vim.g.neoline_red = '#ff5349' -- red orange
    vim.g.neoline_orange = '#ff9326'
    vim.g.neoline_yellow = '#fe6e00' -- blaze orange
    vim.g.neoline_green = '#4CBB17' -- color Kelly
    vim.g.neoline_turquoise = '#3FE0D0'
    vim.g.neoline_aqua = '#18ffe0'
    vim.g.neoline_blue = '#31baff'
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
end

return M
