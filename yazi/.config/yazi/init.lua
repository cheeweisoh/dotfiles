require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})

require("no-status"):setup()

-- local catppuccin_theme = require("yatline-catppuccin"):setup("mocha")
-- require("yatline"):setup({
-- 	section_separator = { open = "", close = "" },
-- 	part_separator = { open = "<In>", close = "<Out>" },
-- 	inverse_separator = { open = "tab", close = "TAB" },
-- 	-- section_separator = { open = "", close = "" },
-- 	-- part_separator = { open = "", close = "" },
-- 	theme = catppuccin_theme,
--
-- 	header_line = {
-- 		left = {
-- 			section_a = {},
-- 			section_b = {},
-- 			section_c = {
-- 				{ type = "string", custom = false, name = "hovered_path", params = { "left" } },
-- 			},
-- 		},
-- 		right = {
-- 			section_a = {
-- 				{ type = "string", custom = true, name = "󰇥 " },
-- 			},
-- 			section_b = {},
-- 			section_c = {
-- 				{ type = "coloreds", custom = false, name = "count" },
-- 			},
-- 		},
-- 	},
-- })
