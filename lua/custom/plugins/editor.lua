return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'dracula',
      },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {}
    end,
    dependencies = {
      {
        'nvim-tree/nvim-web-devicons',
      },
    },
  },
  {
    'folke/which-key.nvim',
    dependencies = {
      'echasnovski/mini.nvim',
    },
    event = 'VeryLazy',
    opts = {
      preset = 'helix',
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      show_help = true,
      spec = {
        { '<leader>b', group = 'buffers' },
        { '<leader>d', group = 'debug' },
        { '<leader>f', group = 'files/find' },
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find File' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
        { '<leader>fn', '<cmd>enew<cr>', desc = 'New File' },
        { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent Files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
        { '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Recently Opened Files' },
        { '<leader>fd', '<cmd>Telescope file_browser<cr>', desc = 'File Browser' },
        { '<leader>g', group = 'git' },
        { '<leader>gb', group = 'git blame' },
        { '<leader>l', group = 'lsp', icon = '󰟀' },
        { '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = 'Code Action' },
        { '<leader>lf', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', desc = 'Format' },
        { '<leader>li', '<cmd>LspInfo<cr>', desc = 'Info' },
        { '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', desc = 'Rename' },
        { '<leader>q', group = 'sessions' },
        { '<leader>t', group = 'toggle' },
        { '<leader>tn', '<cmd>set number!<cr>', desc = 'Line Numbers' },
        { '<leader>tr', '<cmd>set relativenumber!<cr>', desc = 'Relative Numbers' },
        { '<leader>tw', '<cmd>set wrap!<cr>', desc = 'Word Wrap' },
        { '<leader>T', group = 'testing' },
      },
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup()
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      {
        '<C-e>',
        function()
          require('neo-tree.command').execute { toggle = true, dir = vim.loop.cwd() }
        end,
        desc = 'Toggle NeoTree',
      },
      { '<leader>o', ':Neotree focus<CR>', desc = 'Focus NeoTree', silent = true },
      {
        '<leader>ge',
        function()
          require('neo-tree.command').execute { source = 'git_status', toggle = true }
        end,
        desc = 'Git Explorer',
      },
      {
        '<leader>be',
        function()
          require('neo-tree.command').execute { source = 'buffers', toggle = true }
        end,
        desc = 'Buffer Explorer',
      },
    },
    opts = {
      close_if_last_window = true, -- Auto-close Neo-tree if it's the last window
      enable_git_status = true, -- Show Git status
      enable_diagnostics = true, -- Show LSP diagnostics
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- Show dotfiles
          hide_gitignored = false, -- Hide Git-ignored files
        },
        follow_current_file = {
          enabled = true,
        }, -- Focus on the current file in the tree
        use_libuv_file_watcher = true, -- Update Neo-tree in real-time
        window = {
          position = 'left',
          width = 30,
          mappings = {
            ['<leader>e'] = 'close_window', -- Close Neo-tree
            ['<CR>'] = 'open', -- Open file/directory
            ['<C-s>'] = 'split_with_window_picker', -- Open in a split
            ['<C-v>'] = 'vsplit_with_window_picker', -- Open in a vertical split
          },
        },
      },
      buffers = {
        follow_current_file = {
          enable = true,
        }, -- Highlight the current file in the buffers list
        group_empty_dirs = true, -- Group empty directories
        window = {
          position = 'left',
          width = 30,
        },
      },
    },
  },
}
