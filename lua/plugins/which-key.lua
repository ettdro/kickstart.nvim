return {
  {
    "folke/which-key.nvim",
    dependencies = {
      "echasnovski/mini.nvim",
    },
    event = "VeryLazy",
    opts = {
      preset = "helix",
      show_help = true,
      spec = {
        { "<leader>a", group = "ai" },
        { "<leader>b", group = "buffers" },
        { "<leader>c", group = "code", icon = "" },
        { "<leader>d", group = "debug" },
        { "<leader>dw", group = "watches" },
        { "<leader>f", group = "files/find" },
        {
          "<leader> ",
          "<cmd>Telescope find_files<cr>",
          desc = "Find file",
        },
        { "<leader>g", group = "git" },
        { "gl", group = "logs" },
        { "<leader>gh", group = "hunks" },
        { "<leader>q", group = "sessions" },
        { "<leader>s", group = "search" },
        { "<leader>t", group = "testing" },
        { "<leader>T", group = "terminal" },
        { "<leader>u", group = "ui" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
