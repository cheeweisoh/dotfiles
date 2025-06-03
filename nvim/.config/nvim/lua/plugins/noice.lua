return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "MunifTanjim/nui.nvim", lazy = false },
		{
			"rcarriga/nvim-notify",
			lazy = false,
			opts = {
				on_open = function(win)
					local config = vim.api.nvim_win_get_config(win)
					config.border = "rounded"
					vim.api.nvim_win_set_config(win, config)
				end,
				background_colour = "#000000",
			},
		},
	},

	config = function()
		require("noice").setup({
			lsp = {
				progress = { enabled = false },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},

			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},

			views = {
				cmdline_popup = {
					border = {
						style = "rounded",
					},
				},
			},

			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = { "msg_show", "notify" },
						any = {
							{ find = "DBUI" },
							{ find = "DB:" },
						},
					},
					opts = { skip = true },
				},
			},
		})
	end,
}
