return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'marilari88/neotest-vitest',
      'olimorris/neotest-phpunit',
    },
    config = function()
      require('neotest').setup {
        floating = {
          max_width = 0.9,
        },
        adapters = {
          require 'neotest-vitest' {
            -- Set the working directory to client/
            cwd = function()
              return vim.fn.getcwd() .. '/client'
            end,
            -- Filter directories
            filter_dir = function(name, rel_path, root)
              return name ~= 'node_modules' and name ~= 'api'
            end,
            -- Test file detection
            is_test_file = function(file_path)
              if string.match(file_path, 'client/') then
                return string.match(file_path, '__tests__/') or string.match(file_path, '%.test%.') or string.match(file_path, '%.spec%.')
              end
              return false
            end,
          },
        },
      }
    end,
  },
}
