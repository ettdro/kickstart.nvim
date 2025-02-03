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
          function()
            require("fzf-lua").files()
          end,
          desc = "Find file",
        },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>q", group = "sessions" },
        { "<leader>s", group = "search" },
        { "<leader>t", group = "testing" },
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
