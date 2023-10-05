return{
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'williamboman/mason.nvim', config = true },
		  'williamboman/mason-lspconfig.nvim',
		{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
	},

	config = function()
		local mason = require("mason").setup()
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = { "lua_ls" }
		})

		local lspconfig = require("lspconfig")

		lspconfig["lua_ls"].setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognise the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

	end,
}
