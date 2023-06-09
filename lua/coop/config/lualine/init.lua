local config = require("coop.config.lualine.config")

local M = {}

local function setup()
    local cpn = require("coop.config.lualine.components")
    local theme = require("coop.config.lualine.highlights").custom(config.options)

    require("lualine").setup({
        options = {
            theme = theme,
            icons_enabled = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = { "dashboard", "lazy", "alpha" },
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                -- winbar = 100,
            },
        },
        sections = {
            lualine_a = { cpn.mode },
            lualine_b = { cpn.branch, cpn.diff },
            lualine_c = { cpn.diagnostics },
            lualine_x = { cpn.position },
            lualine_y = { cpn.filetype, cpn.encoding },
            lualine_z = { cpn.spaces },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {},
    })
end

M.setup = config.setup

M.load = function()
    setup()
    vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
            setup()
        end,
    })
end

return M

