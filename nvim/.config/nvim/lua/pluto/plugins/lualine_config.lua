return {
    "nvim-lualine/lualine.nvim",

    config = function()
        local lualine = require("lualine")

		lualine.setup({
            options = {
                theme = "nord",
                component_separators = '',
                section_separators = '',
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "filename" },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { "encoding", "filetype"},
                lualine_z = { "branch" },
            }
        })
    end
}
