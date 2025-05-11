return {
  "saghen/blink.cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    { "rafamadriz/friendly-snippets" },
    { "onsails/lspkind.nvim" },
  },
  event = "InsertEnter",
  version = "*",
  opts = function()
    return {
      snippets = {
        preset = "luasnip",
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        menu = {
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon" },
              { "kind" },
            },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local lspkind = require "lspkind"
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
          },
        },
        trigger = {
          show_on_trigger_character = true,
        },
        documentation = {
          auto_show = true,
        },
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
        providers = {
          lsp = {
            min_keyword_length = 1,
            score_offset = 0,
            max_items = 15,
          },
          path = {
            min_keyword_length = 1,
          },
          snippets = {
            min_keyword_length = 2,
          },
          buffer = {
            min_keyword_length = 3,
          },
        },
      },
    }
  end,
}
