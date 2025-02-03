return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute { toggle = true, dir = vim.loop.cwd() }
        end,
        desc = "Toggle NeoTree",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute { source = "git_status", toggle = true }
        end,
        desc = "Git Explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute { source = "buffers", toggle = true }
        end,
        desc = "Buffer Explorer",
      },
    },
  },
}
