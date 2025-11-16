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
        { "<leader>b", group = "buffers" },
        { "<leader>c", group = "code", icon = "" },
        { "<leader>cs", group = "swap" },
        { "<leader>d", group = "debug" },
        { "<leader>dw", group = "watches" },
        { "<leader>f", group = "files/find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>gu", group = "gitsigns ui" },
        { "<leader>h", group = "harpoon", icon = "󱡀" },
        { "<leader>q", group = "sessions" },
        { "<leader>s", group = "search" },
        { "<leader>t", group = "testing" },
        { "<leader>u", group = "ui" },
        { "<leader>w", group = "windows" },
        { "<leader>x", group = "diagnostics", icon = "󰒡" },
      },
      icons = {
        separator = "",
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
