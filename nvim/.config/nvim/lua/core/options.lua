local opt = vim.opt
local api = vim.api
local diagnostic = vim.diagnostic

-- colors
local bordercolor = "#b4befe"
local textcolor = "#cad3f5"

-- tabs / indentations
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- appearance
opt.number = true
opt.relativenumber = false
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

-- telescope
api.nvim_set_hl(0, "TelescopeBorder", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "TelescopePromptBorder", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "TelescopeTitle", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "TelescopePromptTitle", { fg = bordercolor, bg = "none" })

-- noice
api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "NoiceCmdlineIconCmdline", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "NoiceCmdlineIconHelp", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "NoiceCmdlineIconFilter", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "NoiceCmdlineIconInput", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "NoiceCmdlineIconLua", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = bordercolor, bg = "none" })

-- lazygit
api.nvim_set_hl(0, "LazyGitBorder", { fg = bordercolor, bg = "none" })
api.nvim_set_hl(0, "LazyGitFloat", { fg = bordercolor, bg = "none" })

-- diagnostic.config({ virtual_lines = true })
diagnostic.config({ virtual_text = true })
