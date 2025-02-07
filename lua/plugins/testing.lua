return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
      "olimorris/neotest-phpunit",
      "thenbe/neotest-playwright",
    },
    config = function()
      --- @diagnostic disable-next-line
      require("neotest").setup {
        adapters = {
          require "neotest-vitest" {
            filter_dir = function(name, _, _)
              return name ~= "node_modules" and name ~= "playwright"
            end,
          },
          require "neotest-phpunit" {
            phpunit_cmd = function()
              return "/Users/ettdro/test.sh"
            end,
            env = {
              CONTAINER = "php",
              REMOTE_PHPUNIT_BIN = "vendor/bin/phpunit",
              LOCAL_PROJECT_PATH = os.getenv "CLEARESTATE_API_PROJECT_PATH",
            },
            filter_dir = function(name, _, _)
              return name ~= "node_modules" and name ~= "playwright" and name ~= "vendor"
            end,
          },
          require("neotest-playwright").adapter {
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
              filter_dir = function(name, _, _)
                return name ~= "node_modules" and name ~= "src"
              end,
            },
          },
        },
      }
    end,
    keys = {
      { "<leader>t", "", desc = "+test" },
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Run File (Neotest)",
      },
      {
        "<leader>tT",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run All Test Files (Neotest)",
      },
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest (Neotest)",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last (Neotest)",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary (Neotest)",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open { enter = true, auto_close = true }
        end,
        desc = "Show Output (Neotest)",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel (Neotest)",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop (Neotest)",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand "%")
        end,
        desc = "Toggle Watch (Neotest)",
      },
    },
  },
}
