return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        layout_config = {
          vertical = { width = 0.5 },
          prompt_position = "top",
        },
      },
    },
  },
}
