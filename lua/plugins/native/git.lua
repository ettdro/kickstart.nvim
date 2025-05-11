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
      { "<leader>ghr", function() require("gitsigns").reset_hunk() end, desc = "Reset reset hunk" },
      { "]g", function()
        if vim.wo.diff then
          vim.cmd.normal({']c', bang = true})
        else
          require("gitsigns").nav_hunk('next')
        end
      end
      },
      { "[g", function()
        if vim.wo.diff then
          vim.cmd.normal({'[c', bang = true})
        else
          require("gitsigns").nav_hunk('prev')
        end
      end
      }
    },
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    opts = {},
  },
}
