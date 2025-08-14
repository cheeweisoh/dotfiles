return {
	"g0t4/iron.nvim",
	branch = "fix-clear-repl",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local core = require("iron.core")
		local ll = require("iron.lowlevel")
		local marks = require("iron.marks")

		function ensure_open()
			local meta = vim.b[0].repl

			if not meta or not ll.repl_exists(meta) then
				ft = ft or ll.get_buffer_ft(0)
				meta = ll.get(ft)
			end

			if not ll.repl_exists(meta) then
				meta = core.repl_for(ft)
			end

			return meta
		end

		function ensure_open_and_cleared()
			core.clear_repl()

			local meta = ensure_open()
			if meta == nil then
				return
			end

			local sb = vim.bo[meta.bufnr].scrollback
			vim.bo[meta.bufnr].scrollback = 1
			vim.bo[meta.bufnr].scrollback = sb

			return meta
		end

		function clear_then(func)
			return function()
				ensure_open_and_cleared()
				func()
			end
		end

		function send_top_block_then_current_block()
			local meta = ensure_open_and_cleared()
			if not meta then
				return
			end

			local cursor_position = vim.api.nvim_win_get_cursor(0)
			vim.cmd("norm gg")
			core.send_code_block()
			ensure_open_and_cleared()

			vim.api.nvim_win_set_cursor(0, cursor_position)
			core.send_code_block()
		end

		vim.keymap.set(
			"n",
			"<leader>icm",
			clear_then(function()
				core.run_motion("send_motion")
			end),
			{ desc = "clear => send motion" }
		)
		vim.keymap.set(
			"v",
			"<leader>icv",
			clear_then(function()
				core.send(nil, core.mark_visual())
			end),
			{ desc = "clear => send visual" }
		)
		vim.keymap.set("n", "<leader>icf", clear_then(core.send_file), { desc = "clear => send file" })
		vim.keymap.set("n", "<leader>icl", clear_then(core.send_line), { desc = "clear => send line" })
		vim.keymap.set("n", "<leader>icp", clear_then(core.send_paragraph), { desc = "clear => send paragraph" })
		vim.keymap.set("n", "<leader>icb", clear_then(core.send_code_block), { desc = "clear => send block" })
		vim.keymap.set(
			"n",
			"<leader>icn",
			clear_then(function()
				core.send_code_block(true)
			end),
			{ desc = "clear => send block and move to next block" }
		)
		vim.keymap.set(
			"n",
			"<leader>ict",
			clear_then(send_top_block_then_current_block),
			{ desc = "clear => run top block then current block" }
		)
		vim.keymap.set(
			"n",
			"<leader>ist",
			send_top_block_then_current_block,
			{ desc = "run top block then current block" }
		)
		vim.keymap.set("n", "<leader>icc", ensure_open_and_cleared, { desc = "clear" })

		core.setup({
			config = {
				scratch_repl = true,
				repl_definition = {
					sh = {
						command = { "zsh" },
						block_deviders = { "#%%" },
					},
					python = {
						-- command = { "python3" },
						format = function(lines, extras)
							result = require("iron.fts.common").bracketed_paste_python(lines, extras) -- *** defacto is cell per line (yes)
							filtered = vim.tbl_filter(function(line)
								return not string.match(line, "^%s*#")
							end, result)
							return filtered
						end,
						command = { "ipython", "--no-autoindent" },
						block_deviders = { "# %%", "#%%" },
					},
				},
				preferred = {
					python = "ipython",
				},
				repl_filetype = function(bufnr, ft)
					return ft
				end,
				repl_open_cmd = "vertical botright split",
				-- repl_open_cmd = "horizontal botright 20 split",
			},

			keymaps = {
				toggle_repl = "<space>ir", -- toggles the repl open and closed
				restart_repl = "<space>iR", -- calls `IronRestart` to restart the repl
				send_motion = "<space>ism",
				visual_send = "<space>isv",
				send_file = "<space>isf",
				send_line = "<space>isl",
				send_paragraph = "<space>isp",
				send_until_cursor = "<space>isu",
				send_code_block = "<space>isb",
				send_code_block_and_move = "<space>isn",
				mark_motion = "<space>imm", -- mark a selection use a motion
				mark_visual = "<space>imv", -- set marks based on visual selection
				remove_mark = "<space>imd", -- remove marks
				send_mark = "<space>imr", -- ([r]e)send marked code (any other send keymap will mark the range so it can be repeated too with this)
				cr = "<space>is<cr>",
				interrupt = "<space>iq",
				exit = "<space>ix",
			},
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
		})
	end,
}
