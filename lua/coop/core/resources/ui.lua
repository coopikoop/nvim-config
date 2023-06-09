local Icon = require("coop.core.icons")

return {
    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>n",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Delete all Notifications",
            },
        },
        opts = {
            icons = {
                ERROR = Icon.diagnostics.error .. " ",
                INFO = Icon.diagnostics.info .. " ",
                WARN = Icon.diagnostics.warn .. " ",
            },
            timeout = 5000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,

        },
        init = function()
            require("coop.util").on_very_lazy(function()
                vim.notify = require("notify")

                local notify = vim.notify
                vim.notify = function(msg, ...)
                    if msg:match("warning: multiple different client offset_encodings") then
                        return
                    end

                    notify(msg, ...)
                end
            end)
        end,
    },

    {
        "akinsho/bufferline.nvim",
        event = { "BufReadPost" },
        opts = {
            options = {
                diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
                -- separator_style = "slant", -- | "thick" | "thin" | "slope" | { 'any', 'any' },
                separator_style = { "", "" }, -- | "thick" | "thin" | { 'any', 'any' },
                indicator = {
                    -- icon = " ",
                    -- style = 'icon',
                    style = "underline",
                },
                close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
                diagnostics_indicator = function(count, _, _, _)
                    if count > 9 then
                        return "9+"
                    end
                    return tostring(count)
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "EXPLORER",
                        text_align = "center",
                        -- separator = true,
                    },
                },
                hover = {
                    enabled = true,
                    delay = 0,
                    reveal = { "close" },
                },
            },
        },
    },

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
--[[
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            char = "▏",
            context_char = "▏",
            show_end_of_line = false,
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
            filetype_exclude = {
                "help",
                "startify",
                "dashboard",
                "packer",
                "neogitstatus",
                "NvimTree",
                "Trouble",
                "alpha",
                "neo-tree",
            },
            buftype_exclude = {
                "terminal",
                "nofile",
            },
            -- char_highlight_list = {
            --   "IndentBlanklineIndent1",
            --   "IndentBlanklineIndent2",
            --   "IndentBlanklineIndent3",
            --   "IndentBlanklineIndent4",
            --   "IndentBlanklineIndent5",
            --   "IndentBlanklineIndent6",
            -- },
        },
    },
--]]
    {
        "echasnovski/mini.indentscope",
        lazy = false,
        enabled = true,
        -- lazy = true,
        version = false, -- wait till new 0.7.0 release to put it back on semver
        -- event = "BufReadPre",
        opts = {
            symbol = "▏",
            -- symbol = "│",
            options = { try_as_border = false },
        },
        config = function(_, opts)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "lazy",
                    "mason",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
            require("mini.indentscope").setup(opts)
        end,
    },

    {
        "utilyre/barbecue.nvim",
        event = { "BufReadPost" },
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = "auto",
            include_buftypes = { "" },
            exclude_filetypes = { "gitcommit", "Trouble", "toggleterm" },
            show_modified = false,
            kinds = Icon.kinds,
        },
    },

    {
        "akinsho/toggleterm.nvim",
        event = { "BufReadPost" },
        opts = {
            open_mapping = [[<C-\>]],
            start_in_insert = true,
            size = 20,
            direction = "horizontal",
            autochdir = false,
            float_opts = {
                -- border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" }, -- [ top top top - right - bottom bottom bottom - left ]
                border = { " ", "▁", " ", "▎", " ", "▔", " ", "▕" }, -- [ top top top - right - bottom bottom bottom - left ]
                winblend = 0,
            },
            highlights = {
                FloatBorder = { link = "ToggleTermBorder" },
                Normal = { link = "ToggleTerm" },
                NormalFloat = { link = "ToggleTerm" },
            },
            winbar = {
                enabled = true,
                name_formatter = function(term)
                    return string.format("%d:%s", term.id, term:_display_name())
                end,
            },
        },
    },

    {
        "willothy/veil.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim"
        },
        lazy = false,
        event = "VimEnter",
        opts = function()
            return require("coop.config.veil.veil")
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
            handlers = {
                gitsigns = true,
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

    {
        "anuvyklack/windows.nvim",
        event = "WinNew",
        dependencies = {
            { "anuvyklack/middleclass" },
            { "anuvyklack/animation.nvim", enabled = true },
        },
        opts = {
            animation = { enable = true, duration = 150, fps = 60 },
            autowidth = { enable = true },
        },
        keys = { { "<leader>m", "<cmd>WindowsMaximize<CR>", desc = "Zoom window" } },
        init = function()
            vim.o.winwidth = 30
            vim.o.winminwidth = 30
            vim.o.equalalways = true
        end,
    },

    {
        "NvChad/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            filetypes = { "*", "!lazy" },
            buftype = { "*", "!prompt", "!nofile" },
            user_default_options = {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = false, -- "Name" codes like Blue
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                AARRGGBB = false, -- 0xAARRGGBB hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                -- Available modes for `mode`: foreground, background,  virtualtext
                mode = "background", -- Set the display mode.
                virtualtext = "■",
            },
        },
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
            select = { telescope = require("coop.util").telescope_theme("dropdown") },
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

