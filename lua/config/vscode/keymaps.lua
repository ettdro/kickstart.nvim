local map = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

local vscode_action = function(action)
  return "<cmd>lua require('vscode').action('" .. action .. "')<CR>"
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Blocking arrow keys for navigation
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Commands typo handling
vim.cmd "command! W w"
vim.cmd "command! Q q"
vim.cmd "command! WQ wq"
vim.cmd "command! Wq wq"

-- Window management
map("n", "<leader>wh", ":split<CR>", opts "Split window horizontally")
map("n", "<leader>wv", ":vsplit<CR>", opts "Split window vertically")
map("n", "<leader>w]", vscode_action "workbench.action.moveEditorToNextGroup", opts "Move to next group")
map("n", "<leader>w]", vscode_action "workbench.action.moveEditorToPreviousGroup", opts "Move to next group")

-- Buffer management
map("n", "<S-h>", vscode_action "workbench.action.previousEditor", opts "Previous buffer")
map("n", "<S-l>", vscode_action "workbench.action.nextEditor", opts "Next buffer")

map("n", "<leader>ff", vscode_action "workbench.action.quickOpen")
map("n", "<leader>cr", vscode_action "editor.action.rename", opts "Rename")
map("n", "<leader>ca", vscode_action "editor.action.quickFix", opts "Code action")
map("n", "<leader>e", vscode_action "workbench.files.action.focusFilesExplorer", opts "Open Explorer")
map("n", '<leader>s"', "<cmd>reg<CR>", opts "Registers")

map("n", "gs", vscode_action "workbench.action.gotoSymbol")

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
