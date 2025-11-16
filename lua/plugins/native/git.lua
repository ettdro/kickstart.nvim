return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gst", ":Git<CR>", desc = "Git status" },
      { "<leader>gStp", ":Git stash pop<CR>", desc = "Git stash pop" },
      { "<leader>gStl", ":Git stash list<CR>", desc = "Git stash list" },
      { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push" },
      { "<leader>gl", ":Git pull<CR>", desc = "Git pull" },
      { "<leader>gL", ":Git log<CR>", desc = "Git log" },
      { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff split" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    opts = {
      current_line_blame = false,
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
      { "<leader>ghS", function() require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" } end, desc = "Stage single line", },
      { "<leader>ghs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
      { "<leader>ghu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
      { "<leader>ghp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
      { "<leader>ghi", function() require("gitsigns").preview_hunk_inline() end, desc = "Preview hunk inline" },
      { "<leader>ghd", function() require("gitsigns").diffthis() end, desc = "Diff this" },
      { "<leader>ghD", function() require("gitsigns").diffthis('~') end, desc = "Diff this ~" },
      {
        "<leader>ghb",
        function()
          require("gitsigns").blame_line({ full = true })
        end,
        desc = "Blame line",
      },
      { "<leader>ghB", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle current line blame" },
      { "<leader>ghn", function() require("gitsigns").next_hunk() end, desc = "Next hunk" },
      { "<leader>ghN", function() require("gitsigns").prev_hunk() end, desc = "Previous hunk" },
      { "<leader>ghl", function() require("gitsigns").setqflist('all') end, desc = "Set qflist for all hunks" },
      { "<leader>ghL", function() require("gitsigns").setqflist('current') end, desc = "Set qflist for current hunk" },
      { "<leader>ghp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
      { "<leader>ghP", function() require("gitsigns").preview_hunk_inline() end, desc = "Preview hunk inline" },
      { "<leader>gud", function() require("gitsigns").toggle_deleted() end, desc = "Toggle deleted" },
      { "<leader>gus", function() require("gitsigns").toggle_signs() end, desc = "Toggle signs" },
      { "<leader>guh", function() require("gitsigns").toggle_numhl() end, desc = "Toggle numhl" },
      { "<leader>guH", function() require("gitsigns").toggle_linehl() end, desc = "Toggle linehl" },
      { "<leader>gub", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle current line blame" },
      { "<leader>guw", function() require("gitsigns").toggle_word_diff() end, desc = "Toggle word diff" },
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
}
