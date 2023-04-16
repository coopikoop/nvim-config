return {
    {
        "loctvl842/neo-tree.nvim",
        cmd = "Neotree",
        keys = {
            {
                "<leader>e",
                function()
                    require("neo-tree.command").execute({ toggle = true, position = "left", dir = require("coop.util").get_root() })
                end,
                desc = "Explorer (root dir)",
                remap = true,
            },
            {
                "<leader>E",
                function()
                    require("neo-tree.command").execute({
                        toggle = true,
                        position = "float",
                        dir = require("coop.util").get_root(),
                    })
                end,
                desc = "Explorer Float (root dir)",
            },
        },
        init = function()
            vim.g.neo_tree_remove_legacy_commands = 1
            if vim.fn.argc() == 1 then
                local stat = vim.loop.fs_stat(vim.fn.argv(0))
                if stat and stat.type == "directory" then
                    require("neo-tree")
                end
            end
        end,
        config = function()
            require("coop.config.neo-tree")
        end,
    },

    {
        "luukvbaal/statuscol.nvim",
        Lazy = true,
        event = "BufReadPost",
        config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
                relculright = false,
                segments = {
                    {
                        -- line number
                        text = { " ", builtin.lnumfunc },
                        condition = { true, builtin.not_empty },
                        click = "v:lua.ScLa",
                    },
                    { text = { "%C", " " }, click = "v:lua.ScFa" }, -- Fold
                },
            })
        end,
    },
}

