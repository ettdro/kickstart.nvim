-- See `:help lua-guide-autocommands`

-- Highlight on Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Reload Config on Save
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'init.lua',
  command = 'source <afile> | Lazy sync',
})

-- Resize Splits Automatically
vim.api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  command = 'wincmd =',
})
