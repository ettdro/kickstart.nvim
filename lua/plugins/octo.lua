return {
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      mappings = {
        pull_request = {
          open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
        },
      },
    },
  },
}
