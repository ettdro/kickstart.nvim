return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
      require("mini.ai").setup { n_lines = 500 }
      require("mini.surround").setup()
      require("mini.hipatterns").setup()
      require("mini.icons").setup()
      require("mini.notify").setup()
      require("mini.pairs").setup()
    end,
  },
}
