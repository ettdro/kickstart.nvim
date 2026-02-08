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
map("n", "<C-w>a", vscode_action "workbench.action.moveActiveEditorGroupLeft", opts "Move to group to the left")
map("n", "<C-w>d", vscode_action "workbench.action.moveActiveEditorGroupRight", opts "Move to group to the right")
map("n", "<C-w>z", vscode_action "workbench.action.joinAllGroups", opts "Move to next group")
map("n", "<C-w>q", vscode_action "workbench.action.closeEditorsInGroup", opts "Close all editors in group")

-- Buffer management
-- map("n", "<S-Tab>", vscode_action "workbench.action.previousEditor", opts "Previous buffer")
-- map("n", "<Tab>", vscode_action "workbench.action.nextEditor", opts "Next buffer")

map("n", "<leader>ff", vscode_action "workbench.action.quickOpen")
map("n", "<leader>cr", vscode_action "editor.action.rename", opts "Rename")
map("n", "<leader>ca", vscode_action "editor.action.quickFix", opts "Code action")
map("n", "<leader>e", vscode_action "workbench.files.action.focusFilesExplorer", opts "Open Explorer")
map("n", '<leader>s"', "<cmd>reg<CR>", opts "Registers")
map("n", "<C-c>f", "<cmd>let @+ = @/<CR>", opts "Copy search to clipboard")
map("n", "<leader>t", vscode_action "workbench.action.tasks.runTask", opts "Run task")

map("n", "<leader>dn", vscode_action "editor.action.marker.next", opts "Go to next problem")
map("n", "<leader>dp", vscode_action "editor.action.marker.prev", opts "Go to previous problem")

-- Git
map("n", "<leader>ghn", vscode_action "workbench.action.compareEditor.nextChange")
map("n", "<leader>ghn", vscode_action "workbench.action.editor.nextChange")
map("n", "<leader>ghN", vscode_action "workbench.action.compareEditor.previousChange")
map("n", "<leader>ghN", vscode_action "workbench.action.editor.previousChange")
map("n", "<leader>ghp", vscode_action "editor.action.dirtydiff.next")
map("n", "<leader>ghB", vscode_action "git.blame.toggleEditorDecoration")
map("n", "<leader>ghr", vscode_action "git.revertSelectedRanges")
map("v", "<leader>ghr", vscode_action "git.revertSelectedRanges")
map("n", "<leader>gD", vscode_action "git.clean")
