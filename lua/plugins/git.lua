return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
      signs_staged_enable = true,
      signcolumn = true,
    },
    keys = {
      {
        "<leader>ghR",
        function()
          require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end,
        desc = "Reset Hunk",
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
    },
  },
}
