-- status bar settings
vim.cmd "set noshowmode"
vim.cmd "set noshowcmd"
vim.o.laststatus = 3
vim.o.cmdheight = 0

-- use spaces for indents
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- line numbers
vim.wo.number = true

-- theme settings
vim.g.nord_italic = false
vim.g.nord_cursorline_transparent = true
