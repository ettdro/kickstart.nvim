return {
  "saghen/blink.cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    { "rafamadriz/friendly-snippets" },
  },
  event = "InsertEnter",
  version = "*",
  opts = {
    snippets = {
      preset = "luasnip",
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    completion = {
      trigger = {
        show_on_blocked_trigger_characters = {},
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        auto_show = function(ctx)
          return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
        end,
        border = "rounded",
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          min_keyword_length = 0, -- Number of characters to trigger porvider
          score_offset = 0, -- Boost/penalize the score of the items
          max_items = 20,
        },
        path = {
          min_keyword_length = 0,
        },
        snippets = {
          min_keyword_length = 0,
        },
        buffer = {
          min_keyword_length = 0,
        },
      },
    },
  },
}
