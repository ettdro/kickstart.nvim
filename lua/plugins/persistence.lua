return {
  { -- Sessions persistence
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    -- stylua: ignore
    keys = {
        { "<leader>qs", function() require("persistence").load() end, desc = "Restore" },
        { "<leader>qS", function() require("persistence").select() end,desc = "Select" },
        { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last" },
        { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
}
