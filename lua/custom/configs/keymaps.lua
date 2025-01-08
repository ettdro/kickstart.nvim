local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move block UP' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move block DOWN' })

map('n', '<leader>bp', ':bprev<CR>', { desc = 'Go to previous buffer' })
map('n', '<leader>bn', ':bnext<CR>', { desc = 'Go to next buffer' })
map('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete current buffer' })
map('n', '<leader>bl', ':Telescope buffers<CR>', { desc = 'List buffers' })

map('n', '<leader>Tt', "<cmd>lua require('neotest').run.run()<cr>", { desc = 'Run Test' })
