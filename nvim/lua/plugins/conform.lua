return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "gofmt" },
				java = { "google-java-format" },
				lua = { "stylua" },
				python = { "black" },
				sql = { "sleek" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			formatters = {
				black = {
					prepend_args = { "--fast" },
				},
			},
		})
	end,
}
