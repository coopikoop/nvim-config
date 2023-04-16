return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {},
        config = function()
            local lualine_config = require("coop.config.lualine")
            lualine_config.setup({
                float = false,
                separator = "bubble", -- bubble | triangle
                ---@type any
                colorful = true,
            })
            lualine_config.load()
        end,
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    {
        "petertriho/nvim-scrollbar",
        event = "BufReadPost",
        opts = {
            set_highlights = false,
            excluded_filetypes = {
                "prompt",
                "TelescopePrompt",
                "noice",
                "neo-tree",
                "dashboard",
                "alpha",
                "lazy",
                "mason",
                "DressingInput",
                "",
            },
        },
    },

    {
        "folke/noice.nvim",
        lazy = true,
        config = function()
            require("coop.config.noice")
        end,
    },

    -- better vim.ui
    {
        "stevearc/dressing.nvim",
        lazy = true,
        opts = {
            input = {
                border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" }, -- [ top top top - right - bottom bottom bottom - left ]
                win_options = { winblend = 0 },
            },
        },
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
}

