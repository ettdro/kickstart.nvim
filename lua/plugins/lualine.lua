return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "horizon",
      },
      sections = {
        lualine_b = { "diff", "diagnostics" },
      },
    },
  },
}
