return {
  "saghen/blink.cmp",
  dependencies = { "onsails/lspkind.nvim" },
  event = "InsertEnter",
  version = "*",
  opts = {
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },

      --
      menu = {
        border = "rounded",
      },
    },
    sources = {
      default = { "lsp", "path", "buffer", "snippets" },
      providers = {
        lsp = {
          min_keyword_length = 2, -- Number of characters to trigger porvider
          score_offset = 0, -- Boost/penalize the score of the items
        },
        path = {
          min_keyword_length = 0,
        },
        snippets = {
          min_keyword_length = 2,
        },
        buffer = {
          min_keyword_length = 2,
        },
      },
    },
  },
}
