return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin",
                globalstatus = true,
                component_separators = "",
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "" }, padding = { left = 1, right = 2 } } },
                lualine_b = { "filename" },
                lualine_c = {},
                lualine_x = { "diagnostics" },
                lualine_y = { "encoding", "filetype" },
                lualine_z = { { "branch", separator = { right = "" }, padding = { left = 2, right = 1} } },
            },
        })
    end,
}
