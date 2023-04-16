return {
    {
        "SirVer/ultisnips",
        lazy = false,
        config = function()
            vim.g.UltiSnipsSnippetDirectories= { "UltiSnips", "snips" }
            vim.g.UltiSnipsExpandTrigger = "<tab>"
            vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
            vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
        end
    },

    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            vim.cmd([[
                imap <silent><script><expr> <A-Tab> copilot#Accept("\<CR>")
                let g:copilot_no_tab_map = v:true
            ]])
        end
    },

    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "mfussenegger/nvim-jdtls",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "quangnguyen30192/cmp-nvim-ultisnips",
        },
        opts = function()
            local cmp = require("cmp")
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer" } },
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
            })
            return {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        require("ultisnips").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { "i", "c" }),
                    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { "i", "c" }),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["Esc"] = cmp.mapping(function(fallback)
                        require("ultisnips").unlink_current()
                        fallback()
                    end),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "utlisnips" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, item)
                        local icons = require("coop.core.icons").kinds
                        item.kind = icons[item.kind]
                        item.menu = ({
                            nvim_lsp = "Lsp",
                            nvim_lua = "Lua",
                            ultisnips = "Snippet",
                            buffer = "Buffer",
                            path = "Path",
                        })[entry.source.name]
                        return item
                    end,
                },
                experimental = { ghost_text = true },
            }
        end,
    },

    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        config = function(_, opts)
            require("mini.pairs").setup(opts)
        end,
    },

    {
        "ray-x/lsp_signature.nvim",
        event = { "InsertEnter" },
        opts = {
            floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
            floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
            hint_scheme = "Comment", -- highlight group for the virtual text
        },
    },

    {
        "glepnir/lspsaga.nvim",
        lazy = true,
    },
}

