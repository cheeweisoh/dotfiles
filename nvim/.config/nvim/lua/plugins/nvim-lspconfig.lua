return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "williamboman/mason.nvim",
        "windwp/nvim-autopairs",
        "creativenull/efmls-configs-nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local diagnostic_signs = require("util.lsp").diagnostic_signs
        local on_attach = require("util.lsp").on_attach
        local capabilities = cmp_nvim_lsp.default_capabilities()

        for type, icon in pairs(diagnostic_signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Lua
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        -- Python
        lspconfig.pylsp.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                pylsp = {
                    plugins = {
                        black = {
                            enabled = true,
                        },
                        pycodestyle = {
                            enabled = true,
                            ignore = {
                                "E203", -- whitespace before ",", ";", or ":"
                                "E501", -- line too long
                                "W293", -- blank line contains whitespace
                                "W391", -- blank line at end of file
                                -- "E226", -- missing whitespace around arithmetic operator
                            },
                        },
                    },
                },
            },
        })

        -- local luacheck = require("efmls-configs.linters.luacheck")
        local stylua = require("efmls-configs.formatters.stylua")
        -- local flake8 = require("efml-configs.linters.flake8")
        local black = require("efmls-configs.formatters.black")

        lspconfig.efm.setup({
            filetypes = {
                "lua",
                "python",
            },
            init_options = {
                documentFormatting = true,
                documentRangeFormatting = true,
                hover = true,
                documentSymbol = true,
                codeAction = true,
                completion = true,
            },
            settings = {
                languages = {
                    lua = { stylua },
                    python = { black },
                },
            },
        })
    end,
}
