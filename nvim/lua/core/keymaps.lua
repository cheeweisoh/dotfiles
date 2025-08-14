local keymap = vim.keymap

-- nvim tree
keymap.set("n", "<leader>m", "<cmd>NvimTreeFocus<CR>", { desc = "Focus Tree Explorer" })
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree Explorer" })

-- pane nagivation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate Left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate Right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate Down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate Up" })

-- pane management
keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split Vertically" })
keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split Horizontally" })
keymap.set("n", "<S-k>", "<cmd>resize +2<CR>", { desc = "Horizontal Increase Size" })
keymap.set("n", "<S-j>", "<cmd>resize -2<CR>", { desc = "Horizontal Decrease Size" })
keymap.set("n", "<S-h>", "<cmd>vertical resize +2<CR>", { desc = "Vertical Increase Size" })
keymap.set("n", "<S-l>", "<cmd>vertical resize -2<CR>", { desc = "Vertical Decrease Size" })

-- indenting
keymap.set("n", "<", "<gv", { silent = true, noremap = true }, { desc = "Decrease Indent" })
keymap.set("n", ">", ">gv", { silent = true, noremap = true }, { desc = "Increase Indent" })
keymap.set("v", "<", "<gv", { silent = true, noremap = true }, { desc = "Increase Indent" })
keymap.set("v", ">", ">gv", { silent = true, noremap = true }, { desc = "Decrease Indent" })

-- comments
keymap.set("n", "<C-_>", "gcc", { noremap = true }, { desc = "Comment Line" })
keymap.set("v", "<C-_>", "gcc", { noremap = true }, { desc = "Comment Line" })

-- undo search
keymap.set("n", "<leader>/", "<cmd>noh<CR>", { noremap = true }, { desc = "Clear Search" })

-- noice
keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- telescope
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Show Keymaps" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Show Help Tags" })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
keymap.set("n", "<leader>o", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Find Document Symbols" })

-- dbui
keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Toggle DBUI" })

-- iron
keymap.set("n", "<leader>i", "")
keymap.set("t", "<leader><esc>", "<C-\\><C-n>", { desc = "Exit Terminal" })
