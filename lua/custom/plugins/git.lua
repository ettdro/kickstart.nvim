return {
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {
      current_line_blame = true,
    },
    keys = {
      { '<leader>gd', '<cmd>Gitsigns diffthis<CR>', desc = 'Git diff' },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').load_extension 'lazygit'
    end,
    keys = {
      { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'LazyGit' },
    },
  },
}
