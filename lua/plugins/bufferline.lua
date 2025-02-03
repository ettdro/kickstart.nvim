return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
    keys = {
      { "<leader>bx", "<cmd>BufferLineCloseOthers<CR>", desc = "Close others" },
      { "gb", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
    },
  },
}
