return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
						},
					},
					file_ignore_patterns = {
						"venv",
						"__pycache__",
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = false,
						hidden = true,
						borderchars = {
							-- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
							-- results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
							-- preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
							prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
							results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
							preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						},
					},
					live_grep = {
						theme = "dropdown",
						previewer = false,
						borderchars = {
							-- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
							-- results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
							-- preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
							prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
							results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
							preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						},
					},
					buffers = {
						theme = "dropdown",
						previewer = false,
						borderchars = {
							-- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
							-- results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
							-- preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
							prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
							results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
							preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						},
					},
				},
			})
		end,
	},
}
