local mapvimkey = require("util.keymapper").mapvimkey

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
        lazy = false,
		dependencies = {
            "nvim-lua/plenary.nvim"
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
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        previewer = false,
                        hidden = true,
                    },
                    live_grep = {
                        theme = "dropdown",
                        previewer = false,
                    },
                    buffers = {
                        theme = "dropdown",
                        previewer = false,
                    },
                },
            })
		end,
        keys = {
       		mapvimkey("<leader>fk", "Telescope keymaps", "Show Keymaps"),
	    	mapvimkey("<leader>fh", "Telescope help_tags", "Show Help Tags"),
		    mapvimkey("<leader>ff", "Telescope find_files", "Find Files"),
		    mapvimkey("<leader>fg", "Telescope live_grep", "Live Grep"),
		    mapvimkey("<leader>fb", "Telescope buffers", "Find Buffers"),
        }
	},
}
