return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvimdev/lspsaga.nvim",
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local diagnostic_signs = require("util.lsp").diagnostic_signs
		local on_attach = require("util.lsp").on_attach
		local capabilities = cmp_nvim_lsp.default_capabilities()

		for type, icon in pairs(diagnostic_signs) do
			local hl = "DiagnostiSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Go
		vim.lsp.config("gopls", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "go" },
		})
		vim.lsp.enable("gopls")

		-- Java
		vim.lsp.config("jdtls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("jdtls")

		-- Lua
		vim.lsp.config("lua_ls", {
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
		vim.lsp.enable("lua_ls")

		-- Latex
		vim.lsp.config("texlab", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "tex", "plaintex", "latex" },
		})
		vim.lsp.enable("texlab")

		-- Typescript
		vim.lsp.config("vtsls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("vtsls")

		-- Python
		vim.lsp.config("pylsp", {
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
								"E203",
								"E501",
								"W293",
								"W391",
							},
						},
						flake8 = {
							enabled = true,
							line_length = 1000,
							ignore = {
								"E203",
								"E501",
								"W293",
								"W391",
							},
						},
						autopep8 = {
							enabled = true,
							line_length = 1000,
							ignore = {
								"E203",
								"E501",
								"W293",
								"W391",
							},
						},
						mccabe = { enabled = false },
						pycodestyle = {
							enabled = true,
							line_length = 1000,
							ignore = {
								"E203",
								"E501",
								"W293",
								"W391",
							},
						},
						pyflakes = { enabled = false },
					},
				},
			},
		})
		vim.lsp.enable("pylsp")

		-- Rust
		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					check = { command = "clippy" },
				},
			},
		})
		vim.lsp.enable("rust_analyzer")

		-- dbt
		vim.lsp.config("dbt", {
			cmd = { "dbt-language-server" },
			filetypes = { "sql", "yaml" },
			root_dir = require("lspconfig").util.root_pattern("dbt_project.yml"),
		})
		vim.lsp.enable("dbt")
	end,
}
