return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = false,
    },
    init = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
}
