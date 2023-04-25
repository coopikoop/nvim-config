return {
    {
        "coopikoop/themes.nvim",
        lazy = false,
        branch = "master",
        priority = 1000,
        keys = { { "<leader>c", "<cmd>ThemeSelect<cr>", desc = "Select theme" } },
        config = function()
            local theme = require("themes")
            theme.setup({
                transparent_background = false,
                devicons = true,
                filter = "gruvbox", -- classic | octagon | pro | machine | ristretto | spectrum | gruvbox
                day_night = {
                    enable = false,
                    day_filter = "classic",
                    night_filter = "octagon",
                },
                inc_search = "background", -- underline | background
                background_clear = {},
                plugins = {
                    bufferline = {
                        underline_selected = true,
                        underline_visible = true,
                        bold = false,
                    },
                    indent_blankline = {
                        context_highlight = "pro", -- default | pro
                        context_start_underline = true,
                    },
                },
                override = function(c)
                    return {
                        ColorColumn = { bg = c.base.dimmed3 },
                        DashboardRecent = { fg = c.base.magenta },
                        DashboardProject = { fg = c.base.blue },
                        DashboardConfiguration = { fg = c.base.white },
                        DashboardSession = { fg = c.base.green },
                        DashboardLazy = { fg = c.base.cyan },
                        DashboardServer = { fg = c.base.yellow },
                        DashboardQuit = { fg = c.base.red },
                    }
                end,
            })
            theme.load()
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local gruvbox = require("gruvbox")
            gruvbox.setup({
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        end,
    },

    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local nightfox = require("nightfox")
            nightfox.setup({
                palettes = {
                    -- Custom duskfox with black background
                    carbonfox = {
                        bg1 = "#000000", -- Black background
                        bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
                        bg3 = "#121820", -- 55% darkened from stock
                        sel0 = "#131b24", -- 55% darkened from stock
                    },
                },
                specs = {
                    all = {
                        inactive = "bg0", -- Default value for other styles
                    },
                    carbonfox = {
                        inactive = "#090909", -- Slightly lighter then black background
                    },
                },
            })
        end,
    },
}

