local map = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

map("n", "<leader>cr", function()
  local current_word = vim.fn.expand "<cword>"
  vim.ui.input({ prompt = "Search and replace word '" .. current_word .. "' by: " }, function(word)
    if word and word ~= "" then
      vim.cmd(":%s/\\<" .. current_word .. "\\>/" .. vim.fn.escape(word, "/\\") .. "/g")
    end
  end)
end, opts "Search and replace in the current buffer")

-- Replace highlighted text in buffer with entered value
map("v", "<leader>cx", function()
  vim.cmd "normal! y"
  local current_word = vim.fn.getreg '"'
  vim.ui.input({ prompt = "Replace highlighted text '" .. current_word .. "' by: " }, function(word)
    if word and word ~= "" then
      vim.cmd("s/\\%V\\<" .. current_word .. "\\>/" .. vim.fn.escape(word, "/\\") .. "/g")
    end
  end)
end, opts "Search and replace highlighted text in the buffer")

-- Overridden by vim-tmux-navigator plugin
-- map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<leader>cc", "<cmd>ClaudeCode<CR>", opts "Toggle Claude Code")

-- Commands typo handling
vim.cmd "command! W w"
vim.cmd "command! Q q"
vim.cmd "command! WQ wq"
vim.cmd "command! Wq wq"

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Buffer management
map("n", "<C-w>gd", function()
  vim.cmd "vsplit | normal gd"
end, opts "Go to definition in vertical split")
map("n", "<Tab>", ":bnext<CR>", { desc = "Go to next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Go to previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })
map("n", "<leader>bc", ":bwipeout<CR>", { desc = "Close buffer" })
map("n", "<leader>bo", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
end, { desc = "Close all buffers except current" })
