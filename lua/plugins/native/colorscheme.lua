return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     transparent_background = false,
  --   },
  --   init = function()
  --     vim.cmd.colorscheme "catppuccin-mocha"
  --   end,
  -- },
  -- {
  --   "vague-theme/vague.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other plugins
  --   config = function()
  --     -- NOTE: you do not need to call setup if you don't want to.
  --     require("vague").setup {
  --       -- optional configuration here
  --     }
  --     vim.cmd "colorscheme vague"
  --   end,
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
