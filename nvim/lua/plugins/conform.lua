return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "gofmt" },
				java = { "google-java-format" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				lua = { "stylua" },
				python = { "black", "isort" },
				-- sql = { "sleek" },
				-- tex = { "tex-fmt" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000,
			},
			formatters = {
				black = {
					prepend_args = { "--fast", "--line-length", "200" },
				},
				prettier = {},
			},
		})
	end,
}
