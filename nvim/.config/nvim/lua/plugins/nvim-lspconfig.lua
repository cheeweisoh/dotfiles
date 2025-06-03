return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local diagnostic_signs = require("util.lsp").diagnostic_signs
		local on_attach = require("util.lsp").on_attach
		local capabilities = cmp_nvim_lsp.default_capabilities()

		for type, icon in pairs(diagnostic_signs) do
			local hl = "DiagnostiSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Go
		lspconfig.gopls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Java
		lspconfig.jdtls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

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
					configurationSources = { "flake8" },
					plugins = {
						black = {
							enabled = false,
							line_length = 1000,
							ignore = {
								"E203", -- whitespace before ",", ";", or ":"
								"E501", -- line too long
								"W293", -- blank line contains whitespace
								"W391", -- blank line at end of file
							},
						},
						flake8 = {
							enabled = true,
							line_length = 1000,
							ignore = {
								"E203", -- whitespace before ",", ";", or ":"
								"E501", -- line too long
								"W293", -- blank line contains whitespace
								"W391", -- blank line at end of file
							},
						},
						autopep8 = {
							enabled = true,
							line_length = 1000,
							ignore = {
								"E203", -- whitespace before ",", ";", or ":"
								"E501", -- line too long
								"W293", -- blank line contains whitespace
								"W391", -- blank line at end of file
							},
						},
						mccabe = { enabled = false },
						pycodestyle = {
							enabled = true,
							line_length = 1000,
							ignore = {
								"E203", -- whitespace before ",", ";", or ":"
								"E501", -- line too long
								"W293", -- blank line contains whitespace
								"W391", -- blank line at end of file
							},
						},
						pyflakes = { enabled = false },
					},
				},
			},
		})
	end,
}
