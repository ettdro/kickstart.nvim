return {
  -- {
  -- "catppuccin/nvim",
  -- name = "catppuccin",
  -- priority = 1000,
  -- opts = {
  --   transparent_background = false,
  -- },
  -- init = function()
  --   -- vim.cmd.colorscheme "catppuccin-mocha"
  -- end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   opts = {
  --     variant = "moon",
  --   },
  --   config = function()
  --     vim.cmd "colorscheme rose-pine"
  --   end,
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd "colorscheme tokyonight-storm"
    end,
  },
}
