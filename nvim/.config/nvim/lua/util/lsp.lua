local keymap = vim.keymap
local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts, { desc = "Open Finder" })
	keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts, { desc = "Peak Definition" })
	keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts, { desc = "Go To Definition" })
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts, { desc = "Available Code Actions" })
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts, { desc = "Smart Rename" })
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts, { desc = "Show Line Diagnostics" })
	keymap.set("n", "<leader>ds", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts, { desc = "Show Cursor Dignostics" })
	keymap.set("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts, { desc = "Go To Previous Diagnostic" })
	keymap.set("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts, { desc = "Go To Next Diagnostic" })
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts, { desc = "Hover Documentation" })

	if client.name == "pyright" then
		keymap.set("n", "<Leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts, { desc = "Pyright Organise Imports" })
	end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
