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
					config.border = "single"
					vim.api.nvim_win_set_config(win, config)
				end,
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
						style = "single",
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
				},
				opts = { skip = true },
			},

		})
	end,
}
