local mapkey = require("util.keymapper").mapvimkey

-- nvim tree
mapkey("<leader>m", "NvimTreeFocus", "n") -- focus tree explorer
mapkey("<Leader>e", "NvimTreeToggle", "n") -- toggle tree explorer

-- pane nagivation
mapkey("<C-h>", "<C-w>h", "n") -- navigate left
mapkey("<C-j>", "<C-w>j", "n") -- navigate right
mapkey("<C-k>", "<C-w>k", "n") -- navigate up
mapkey("<C-l>", "<C-w>l", "n") -- navigate down

-- pane management
mapkey("<leader>sv", "vsplit", "n") -- split vertically
mapkey("<leader>sh", "split", "n") -- split horizontally
-- mapkey("<C-Up>", "resize +2", "n") -- horizontal increase size
-- mapkey("<C-Down>", "resize -2", "n") -- horizontal decrease size
-- mapkey("<C-Left>", "vertical resize +2", "n") -- vertical increase size
-- mapkey("<C-Right>", "vertical resize -2", "n") -- vertical decrease size

-- indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = True})
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = True})
