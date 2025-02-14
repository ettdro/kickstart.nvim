return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
      require("mini.ai").setup { n_lines = 500 }
      require("mini.hipatterns").setup()
      require("mini.icons").setup()
      require("mini.pairs").setup()
      require("mini.comment").setup()
    end,
  },
}
