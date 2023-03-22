local servers = {
    clangd = {
        settings = {
            cmd = {
                "/opt/homebrew/opt/llvm/bin/clangd",
                "--background-index",
                "--pch-storage=memory",
                "--all-scopes-completion",
                "--pretty",
                "--header-insertion=never",
                "-j=4",
                "--inlay-hints",
                "--header-insertion-decorators",
                "--function-arg-placeholders",
                "--completion-style=detailed"
            },
            filetypes = {"c", "cpp", "objc", "objcpp"},
            init_option = { fallbackFlags = {  "-std=c++2a"  } },
        }
    },
    cssls = {},
    html = {},
    jsonls = {},
    sqlls = {},
    intelephense = {}, -- php language server
    jdtls = {},
    lua_ls = {
        settings = {
            Lua = {
                hint = {
                    enable = true,
                    arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
                    await = true,
                    paramName = "Disable", -- "All", "Literal", "Disable"
                    paramType = false,
                    semicolon = "Disable", -- "All", "SameLine", "Disable"
                    setType = true,
                },
                runtime = {
                    version = "LuaJIT",
                    special = {
                        reload = "require",
                    },
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = false,
                        [vim.fn.stdpath("config") .. "/lua"] = false,
                    },
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    },
    tsserver = {
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    },
    pyright = {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic",
                    diagnosticMode = "workspace",
                    inlayHints = {
                        variableTypes = true,
                        functionReturnTypes = true,
                    },
                },
            },
        },
    },
    bashls = {},
}

return servers

