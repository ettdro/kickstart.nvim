return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
      require("mini.icons").setup()
      require("mini.comment").setup()
    end,
  },
}
