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
							line_length = 1000,
						},
						flake8 = {
							enable = true,
							maxLineLength = 1000,
						},
						pycodestyle = {
							enabled = true,
							maxLineLength = 1000,
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

		-- Java
		lspconfig.jdtls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- local luacheck = require("efmls-configs.linters.luacheck")
		local stylua = require("efmls-configs.formatters.stylua")
		-- local flake8 = require("efml-configs.linters.flake8")
		local black = require("efmls-configs.formatters.black")

		local java_format_config = {
			filetypes = { "java" },
			init_options = {
				filetypes = { "java" },
				format = {
					command = "google-java-format",
					args = {
						"--style=google",
						"--length=120",
						"--indent_spaces=4",
						"--align_type_annotations",
					},
				},
			},
		}

		lspconfig.efm.setup({
			filetypes = {
				"lua",
				"python",
				"java",
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
					java = { java_format_config },
				},
			},
		})
	end,
}
