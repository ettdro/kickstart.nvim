return {
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = {
      theme = "doom",
      config = {
        center = {
          {
            icon = "󰦛 ",
            icon_hl = "group",
            desc = "Restore last session",
            desc_hl = "group",
            key = "s",
            key_hl = "group",
            key_format = " %s",
            action = "lua require('persistence').load()",
          },
          {
            icon = " ",
            icon_hl = "group",
            desc = "Find files",
            desc_hl = "group",
            key = "f",
            key_hl = "group",
            key_format = " %s",
            action = "lua require('fzf-lua').files()",
          },
        },
        footer = {},
        vertical_center = false, -- Center the Dashboard on the vertical (from top to bottom)
      },
    },
  },
}
