return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod" },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysqp", "plsql" } },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_disable_info_notifications = 1
		vim.g.db_ui_auto_execute_table_helpers = 1
		vim.g.db_ui_winwidth = 30
		vim.g.db_ui_show_help = 0
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "dbout" },
			callback = function()
				vim.opt.foldenable = false
			end,
		})
	end,
}
