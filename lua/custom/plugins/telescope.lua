return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim', -- For better fuzzy matching
      build = 'make',
      'nvim-telescope/telescope-file-browser.nvim', -- File browser
      'nvim-telescope/telescope-ui-select.nvim', -- UI select extension
    },
    pickers = {
      find_files = {
        theme = 'dropdown',
      },
    },
  },
}
