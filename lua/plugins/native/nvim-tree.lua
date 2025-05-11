return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      update_focused_file = {
        enable = true,
      },
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
    },
    keys = {
      { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree", mode = { "n", "v" } },
    },
  },
}
