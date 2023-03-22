return {
    {
        "neovim/nvim-lspconfig",
        branch = "master",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        keys = {
            { "<leader>La", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
            { "<leader>Ld", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "Document Diagnostics" },
            { "<leader>Lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
            { "<leader>Li", "<cmd>LspInfo<cr>", desc = "Info" },
            { "<leader>LI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
            { "<leader>Lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
            { "<leader>Lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
            { "<leader>Ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
            { "<leader>Lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
            { "<leader>Lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
            { "<leader>Ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
            { "<leader>LS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
            {
                "<leader>W",
                function()
                    vim.lsp.buf.format({
                        filter = function(client)
                            -- do not use default `lua_ls` to format
                            local exclude_servers = { "lua_ls" }
                            return not vim.tbl_contains(exclude_servers, client.name)
                        end,
                    })
                    vim.cmd([[w!]])
                end,
                desc = "Format and Save",
            },
        },
        config = function()
            -- special attach lsp
            require("coop.util").on_attach(function(client, buffer)
                require("coop.config.lsp.keymaps").on_attach(client, buffer)
                require("coop.config.lsp.inlayhints").on_attach(client, buffer)
                require("coop.config.lsp.gitsigns").on_attach(client, buffer)
            end)

            -- diagnostics
            for name, icon in pairs(require("coop.core.icons").diagnostics) do
                name = "DiagnosticSign" .. name
                vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
            end
            vim.diagnostic.config(require("coop.config.lsp.diagnostics")["on"])

            local servers = require("coop.config.lsp.servers")
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }

            local function setup(server)
                local server_opts = vim.tbl_deep_extend("force", {
                    capabilities = vim.deepcopy(capabilities),
                }, servers[server] or {})
                require("lspconfig")[server].setup(server_opts)
            end

            local mason_lspconfig = require("mason-lspconfig")
            local available = mason_lspconfig.get_available_servers()

            local ensure_installed = {}
            for server, server_opts in pairs(servers) do
                if server_opts then
                    if not vim.tbl_contains(available, server) then
                        setup(server)
                    else
                        ensure_installed[#ensure_installed + 1] = server
                    end
                end
            end

            require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
            require("mason-lspconfig").setup_handlers({ setup })
        end,
    },

    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup()
        end,
        opts = {
            -- ui = {
            --   -- border = "rounded",
            --   border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" },
            --   icons = {
            --       package_installed = "◍",
            --       package_pending = "◍",
            --       package_uninstalled = "◍",
            --   },
            -- },
            log_level = vim.log.levels.DEBUG,
            -- max_concurrent_installers = 4,
        },
    },
}

