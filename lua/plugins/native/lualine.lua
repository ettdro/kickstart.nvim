return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = {
          {
            "filename",
            color = function()
              return { fg = vim.bo.modified and "#f7cf19" }
            end,
            symbols = {
              modified = "●",
              readonly = "󰈈",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
          {
            "harpoon2",
            indicators = { "a", "s", "q", "w" },
            active_indicators = { "A", "S", "Q", "W" },
            color_active = { fg = "#00AAFF" },
            _separator = " ",
            no_harpoon = "Harpoon not loaded",
          },
        },
      },
    },
  },
}
