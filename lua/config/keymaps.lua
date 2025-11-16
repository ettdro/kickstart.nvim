local map = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

map("n", "K", function()
  vim.lsp.buf.hover {
    border = "rounded",
  }
end, opts "Show hover documentation")

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

local function peek_definition()
  local params = vim.lsp.util.make_position_params(0, "utf-8")
  return vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
    if result == nil or vim.tbl_isempty(result) then
      return nil
    end
    local _, win_id = vim.lsp.util.preview_location(result[1], { border = "single" })
    if win_id then
      vim.api.nvim_set_current_win(win_id)
    end
  end)
end

local function rename_lsp()
  -- Check if any LSP client supports rename
  local clients = vim.lsp.get_clients { bufnr = 0 }
  local has_rename = false

  for _, client in pairs(clients) do
    if client.server_capabilities.renameProvider then
      has_rename = true
      break
    end
  end

  if has_rename then
    vim.lsp.buf.rename()
  else
    -- Fallback to search and replace
    local word = vim.fn.expand "<cword>"
    vim.ui.input({ prompt = 'Rename "' .. word .. '" to: ', default = word }, function(new_name)
      if new_name and new_name ~= "" and new_name ~= word then
        vim.cmd(":%s/\\<" .. vim.fn.escape(word, "/\\") .. "\\>/" .. vim.fn.escape(new_name, "/\\") .. "/g")
      end
    end)
  end
end

map("n", "grp", peek_definition, opts "Peek Definition")
map("n", "grn", rename_lsp, opts "Rename symbol (LSP or fallback)")

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

-- Treesitter
map("n", "g;", ":lua require('nvim-treesitter.textobjects.repeatable_move').repeat_last_move_next()<CR>", { desc = "Move to next text object" })
map("n", "g,", ":lua require('nvim-treesitter.textobjects.repeatable_move').repeat_last_move_previous()<CR>", { desc = "Move to previous text object" })
map("n", "gtc", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, opts "Go to context")

local function find_file(filename)
  -- Use fd (faster) or fallback to find
  local search_cmd = 'fd -t f -p "' .. filename .. '" .' -- fd command
  if vim.fn.executable "fd" == 0 then
    search_cmd = 'find . -type f -name "' .. filename .. '"' -- fallback to find
  end

  local result = vim.fn.systemlist(search_cmd)
  if #result > 0 then
    return result[1] -- Return the first match
  end
  return nil
end

local function toggle_vue_test()
  local file = vim.fn.expand "%:p" -- Get full path of current file
  local filename = vim.fn.fnamemodify(file, ":t") -- Get filename only

  if filename:match "%.spec%.ts$" then
    -- Convert test file to Vue component
    local component_filename = filename:gsub("%.spec%.ts$", ".vue")
    local component_path = find_file(component_filename)
    if component_path then
      vim.cmd("edit " .. component_path)
    else
      print("Vue component not found: " .. component_filename)
    end
  elseif filename:match "%.vue$" then
    -- Convert Vue component to test file
    local test_filename = filename:gsub("%.vue$", ".spec.ts")
    local test_path = find_file(test_filename)
    if test_path then
      vim.cmd("edit " .. test_path)
    else
      print("Test file not found: " .. test_filename)
    end
  else
    print "Not a Vue component or test file"
  end
end

map("n", "<leader>tg", toggle_vue_test, opts "Toggle between Vue component and test file")
