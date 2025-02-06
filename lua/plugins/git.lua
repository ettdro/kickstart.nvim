return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 100,
      },
      signs_staged_enable = true,
      signcolumn = true,
    },
    -- stylua: ignore
    keys = {
      { "<leader>ghR", function() require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" } end, desc = "Reset single line", },
      { "<leader>ghr", function() require("gitsigns").reset_hunk() end, desc = "Reset reset hunk" }
    },
  },
}
