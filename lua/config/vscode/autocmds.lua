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
