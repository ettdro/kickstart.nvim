return {
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
      {
        "<leader>xo",
        function()
          vim.diagnostic.open_float {
            border = "rounded",
          }
          -- Configure popup options
          -- local opts = {
          --   relative = "cursor",
          --   width = 100,
          --   height = 10,
          --   col = 0,
          --   row = 0,
          --   style = "minimal",
          --   border = "rounded",
          -- }
          -- Open the popup window
          -- local win = vim.api.nvim_open_win(buf, true, opts)
          --
          -- vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<cr>", {
          --   noremap = true,
          --   silent = true,
          -- })
        end,
        desc = "Document Diagnostics (Trouble)",
      },
    },
  },
}
