local map = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- Blocking arrow keys for navigation
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move lines
map("n", "<M-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<M-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<M-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<M-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<M-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<M-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Buffer management
map("n", "<S-Tab>", ":bprev<CR>", opts "Previous buffer")
map("n", "<Tab>", ":bnext<CR>", opts "Next buffer")
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })
map("n", "<leader>bc", ":bwipeout<CR>", { desc = "Close buffer" })

map("n", "<S-u>", ":redo<CR>", { desc = "Redo" })

-- Window management
map("n", "<leader>wh", ":split<CR>", opts "Split window horizontally")
map("n", "<leader>wv", ":vsplit<CR>", opts "Split window vertically")
