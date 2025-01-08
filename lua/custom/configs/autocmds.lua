-- See `:help lua-guide-autocommands`

-- Highlight on Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Resize Splits Automatically
vim.api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  command = 'wincmd =',
})

-- Close Neotree before persisting the session.
-- This prevents a bug.
vim.api.nvim_create_autocmd('User', {
  pattern = 'PersistenceSavePre',
  callback = function()
    vim.cmd 'Neotree close'
  end,
  desc = 'Close Neo-tree before saving session',
})

-- Restores highlighting from treesitter.
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argv(0) == '' then -- Only restore if no file is passed as an argument
      local last_cwd = vim.g.last_project_cwd -- Track last known project
      local current_cwd = vim.fn.getcwd()

      if last_cwd and last_cwd ~= current_cwd then
        vim.cmd 'bufdo bwipeout' -- Clear buffers only when switching projects
      end

      vim.g.last_project_cwd = current_cwd
      require('persistence').load()

      vim.cmd 'filetype detect'
    end
  end,
})
