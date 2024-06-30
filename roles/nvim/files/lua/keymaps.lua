-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
KEYMAP("n", "<leader>%", "<cmd> source % <CR>", { desc = "Reload config" }) -- reload config

KEYMAP("n", "<leader>/", "<cmd>nohl<CR>", { desc = "Cancel find & replace" }) -- cancel find & replace

-- neotree
KEYMAP("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" }) -- toggle neotree

-- increment/decrement numbers
KEYMAP("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
KEYMAP("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
KEYMAP("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
KEYMAP("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
KEYMAP("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
KEYMAP("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- focus next window (left/bottom/top/right)
KEYMAP("n", "<leader>h", "<C-w>h", { desc = "Focus left window" })
KEYMAP("n", "<leader>j", "<C-w>j", { desc = "Focus bottom window" })
KEYMAP("n", "<leader>k", "<C-w>k", { desc = "Focus top window" })
KEYMAP("n", "<leader>l", "<C-w>l", { desc = "Focus right window" })
-- tabs
KEYMAP("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
KEYMAP("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
KEYMAP("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
KEYMAP("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
KEYMAP("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- PLUGIN KEYMAPS

-- telekasten (notes)
KEYMAP("n", "<leader>z", "<cmd>Telekasten panel<CR>", { desc = "Telekasten: open panel" })
KEYMAP("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", { desc = "Telekasten: new note" })
KEYMAP("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", { desc = "Telekasten: find notes" })
KEYMAP("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>", { desc = "Telekasten: live_grep in notes" })
KEYMAP("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", { desc = "Telekasten: todays notes" })
KEYMAP("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", { desc = "Telekasten: show calendar" })
KEYMAP("n", "<leader>zt", "<cmd>Telekasten toggle_todo<CR>", { desc = "Telekasten: toggle todo status of a line" })
KEYMAP({ "n", "v" }, "<leader>zi", "<cmd>Telekasten insert_img_link<CR>", { desc = "Telekasten: insert image link" })
KEYMAP({ "n", "v" }, "<leader>zl", "<cmd>Telekasten follow_link<CR>", { desc = "Telekasten: follow link" })

-- keymap("i", "[[", "<cmd>Telekasten insert_link<CR>", { desc = "Telekasten: automatically insert link when typing [[")

-- Remap ? for forward search
NV_KEYMAP("n", "?", "/", { desc = "Search inside of file" })
NV_KEYMAP("v", "?", "/", { desc = "Search inside of file" })
