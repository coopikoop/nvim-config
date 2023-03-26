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
}

