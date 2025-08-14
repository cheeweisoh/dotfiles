return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
        require("nvim-treesitter.configs").setup({
            build = ":TSUpdate",
            indent = { enable = true },
            autotag = { enable = true },
            ensure_install = {
                "markdown",
                "markdown_inline",
                "json",
                "java",
                "bash",
                "lua",
                "vim",
                "gitignore",
                "python",
                "sql",
                "regex",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
        })
    end,
}
