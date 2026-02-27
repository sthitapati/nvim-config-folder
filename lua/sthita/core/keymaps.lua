vim.g.mapleader = " "

local keymap = vim.keymap -- for brevity

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"}) 

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "clear search highlights"})

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split windows vertically"})
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split windows horizontally"})
keymap.set("n", "<leader>se", "<C-w>=", { desc = "split windows equally"})
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split"})

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab"})
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close curent tab"})
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab"})
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to previous tab"})
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current buffer in new tab"})

-- theme switcher
keymap.set("n", "<leader>th", "<cmd>Themery<CR>", { desc = "Open theme switcher" })

-- window maximizer (inline toggle)
local maximized = false
keymap.set("n", "<leader>sm", function()
  if maximized then
    vim.cmd("wincmd =")
    maximized = false
  else
    vim.cmd("wincmd |")
    vim.cmd("wincmd _")
    maximized = true
  end
end, { desc = "Maximize/minimize a split" })

 
