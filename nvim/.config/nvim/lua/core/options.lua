local opt = vim.opt

-- tabs / indentations
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- appearance
opt.number = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cmdheight = 0
opt.laststatus = 3
vim.cmd("set noshowmode")
vim.cmd("set noshowcmd")
opt.completeopt = "menuone,noinsert,noselect"

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.encoding = "UTF-8"
opt.clipboard:append("unnamedplus")

-- theme settings
vim.g.nord_italic = false
vim.g.nord_cursorline_transparent = true
