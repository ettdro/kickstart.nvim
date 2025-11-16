-- Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "php", "vue" },
  callback = function()
    if vim.bo.filetype == "php" then
      vim.bo.commentstring = "// %s"
    elseif vim.bo.filetype == "vue" then
      vim.bo.commentstring = "<!-- %s -->"
    end
  end,
})

-- Workaround for vscode-neovim UI desync (issue #2117)

-- 1. Redraw on CursorHold (idle for some time)
local redraw_fix = vim.api.nvim_create_augroup("VSCodeRedrawFix", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  group = redraw_fix,
  callback = function()
    vim.cmd "silent! mode" -- triggers a lightweight redraw
  end,
})

-- 2. Redraw immediately after text changes (e.g., visual delete)
local redraw_group = vim.api.nvim_create_augroup("RedrawOnDelete", { clear = true })
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  group = redraw_group,
  callback = function()
    if vim.fn.mode() == "n" then
      vim.cmd "silent! mode" -- refresh UI after delete/insert
    end
  end,
})
