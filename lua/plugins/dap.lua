return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      -- PHP Debug Configuration
      dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter", -- Ensure php-debug-adapter is installed
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Debug",
          program = "${file}",
          cwd = "${workspaceFolder}",
          port = 9000, -- Xdebug port
        },
      }

      -- DAP UI setup
      dapui.setup()

      -- Auto open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
    keys = {
      {
        "<leader>dr",
        function()
          vim.cmd "DapNew"
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("2", "n", true)
            vim.defer_fn(function()
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true)
            end, 100)
          end, 100)
        end,
        desc = "Run Debugging",
      },
      { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
      {
        "<leader>ds",
        function()
          require("dap").terminate()
          require("dapui").toggle()
        end,
        desc = "Stop Debugging",
      },
      { "<F5>", "<cmd>DapContinue<CR>", desc = "Continue Debugging" },
      { "<F10>", "<cmd>DapStepOver<CR>", desc = "Step Over" },
      { "<F11>", "<cmd>DapStepInto<CR>", desc = "Step Into" },
      { "<F12>", "<cmd>DapRestartFrame<CR>", desc = "Restart Frame" },
      {
        "<leader>dwa",
        function()
          require("dapui").elements.watches.add()
        end,
        desc = "Add Watch",
      },
      {
        "<leader>dwr",
        function()
          require("dapui").elements.watches.remove()
        end,
        desc = "Remove Watch",
      },
    },
  },
}
