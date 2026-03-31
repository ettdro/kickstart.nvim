return {
  {
    "stevearc/overseer.nvim",
    ---@module 'overseer'
    ---@type overseer.SetupOpts
    opts = {
      task_list = {
        min_height = 20,
      },
      -- Prevent auto-discovery so we can re-register it first (see config below)
      disable_template_modules = { "overseer.template.vscode" },
    },
    config = function(_, opts)
      local overseer = require "overseer"
      overseer.setup(opts)
      -- Re-register vscode template as a named provider.
      -- registered_providers are iterated before auto-discovered file_providers,
      -- so tasks.json tasks appear first in OverseerRun picker.
      overseer.register_template {
        name = "vscode",
        module = "overseer.template.vscode",
        generator = require("overseer.template.vscode").generator,
      }
    end,
    keys = {
      { "<leader>to", "<cmd>OverseerOpen<cr>", desc = "Open panel" },
      { "<leader>tc", "<cmd>OverseerClose<cr>", desc = "Close panel" },
      { "<leader>tt", "<cmd>OverseerToggle<cr>", desc = "Toggle panel" },
      {
        "<leader>tr",
        function()
          local root = vim.fn.getcwd()
          -- Descend into client/ or api/ if that subfolder contains a package.json
          for _, sub in ipairs { "client", "api" } do
            local subpath = vim.fs.joinpath(root, sub)
            if vim.uv.fs_stat(vim.fs.joinpath(subpath, "package.json")) then
              root = subpath
              break
            end
          end
          local prev = vim.fn.getcwd()
          vim.fn.chdir(root)
          vim.cmd "OverseerRun"
          vim.fn.chdir(prev)
        end,
        desc = "Run task",
      },
      { "<leader>ta", "<cmd>OverseerTaskAction<cr>", desc = "Task action picker" },
      { "<leader>ts", "<cmd>OverseerShell<cr>", desc = "Run a shell command as Overseer task" },
    },
  },
}
