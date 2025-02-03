return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      winopts = {
        preview = {
          hidden = false,
          layout = "vertical", -- When not hidden
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>fc", function() require("fzf-lua").commands() end, desc = "Find commands", },
      { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find file", },
      { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Find grep", },
      { "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Find keymaps", },
      { "<leader>fp", function() require("fzf-lua").colorschemes() end, desc = "Find Colorscheme Preview" },
      { "<leader>fr", function() require("fzf-lua").resume() end, desc = "Resume file search", },
      { "<leader>ss", function() require("fzf-lua").lsp_document_symbols() end, desc = "Go to symbol", },
    },
  },
}
