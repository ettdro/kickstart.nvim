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

-- Treesitter
map("n", "g;", ":lua require('nvim-treesitter.textobjects.repeatable_move').repeat_last_move_next()<CR>", { desc = "Move to next text object" })
map("n", "g,", ":lua require('nvim-treesitter.textobjects.repeatable_move').repeat_last_move_previous()<CR>", { desc = "Move to previous text object" })

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
