-- nvim tree
vim.keymap.set("n", "<leader>m", "<cmd>NvimTreeFocus<CR>", { desc = "Focus Tree Explorer" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree Explorer" })

-- pane nagivation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate Left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate Right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate Down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate Up" })

-- pane management
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split Vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split Horizontally" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Horizontal Increase Size"})
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Horizontal Decrease Size"})
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<CR>", { desc = "Vertical Increase Size"})
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<CR>", { desc = "Vertical Decrease Size"})

-- indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = true })

-- noice
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
