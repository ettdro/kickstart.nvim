return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require("nvim-treesitter-textobjects").setup {
        select = { lookahead = false },
      }

      local select = require "nvim-treesitter-textobjects.select"
      local move = require "nvim-treesitter-textobjects.move"
      local swap = require "nvim-treesitter-textobjects.swap"
      local repeat_move = require "nvim-treesitter-textobjects.repeatable_move"

      -- ── Select ──────────────────────────────────────────────────────────
      local select_maps = {
        ["a="] = "@assignment.outer",
        ["i="] = "@assignment.inner",
        ["l="] = "@assignment.lhs",
        ["r="] = "@assignment.rhs",
        ["a:"] = "@property.outer",
        ["i:"] = "@property.inner",
        ["l:"] = "@property.lhs",
        ["r:"] = "@property.rhs",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["am"] = "@call.outer",
        ["im"] = "@call.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["as"] = "@statement.outer",
        ["is"] = "@statement.inner",
        ["a/"] = "@comment.outer",
        ["i/"] = "@comment.inner",
      }
      for key, query in pairs(select_maps) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(query, "textobjects")
        end, { desc = query })
      end

      -- ── Move ────────────────────────────────────────────────────────────
      local move_maps = {
        -- next start
        ["]f"] = { fn = move.goto_next_start, query = "@function.outer" },
        ["]c"] = { fn = move.goto_next_start, query = "@class.outer" },
        ["]a"] = { fn = move.goto_next_start, query = "@parameter.inner" },
        ["]s"] = { fn = move.goto_next_start, query = "@statement.outer" },
        ["]i"] = { fn = move.goto_next_start, query = "@conditional.inner" },
        -- next end
        ["]F"] = { fn = move.goto_next_end, query = "@function.outer" },
        ["]C"] = { fn = move.goto_next_end, query = "@class.outer" },
        ["]A"] = { fn = move.goto_next_end, query = "@parameter.inner" },
        ["]S"] = { fn = move.goto_next_end, query = "@statement.inner" },
        -- prev start
        ["[f"] = { fn = move.goto_previous_start, query = "@function.outer" },
        ["[c"] = { fn = move.goto_previous_start, query = "@class.outer" },
        ["[a"] = { fn = move.goto_previous_start, query = "@parameter.inner" },
        ["[s"] = { fn = move.goto_previous_start, query = "@statement.outer" },
        ["[i"] = { fn = move.goto_previous_start, query = "@conditional.inner" },
        -- prev end
        ["[F"] = { fn = move.goto_previous_end, query = "@function.outer" },
        ["[C"] = { fn = move.goto_previous_end, query = "@class.outer" },
        ["[A"] = { fn = move.goto_previous_end, query = "@parameter.inner" },
        ["[S"] = { fn = move.goto_previous_end, query = "@statement.inner" },
      }
      for key, map in pairs(move_maps) do
        vim.keymap.set("n", key, function()
          map.fn(map.query, "textobjects")
        end, { desc = map.query })
      end

      vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)

      -- ── Swap ────────────────────────────────────────────────────────────
      local swap_next_maps = {
        ["<leader>csa"] = "@parameter.inner",
        ["<leader>csp"] = "@property.outer",
      }
      local swap_prev_maps = {
        ["<leader>csA"] = "@parameter.inner",
        ["<leader>csP"] = "@property.outer",
      }
      for key, query in pairs(swap_next_maps) do
        vim.keymap.set("n", key, function()
          swap.swap_next(query, "textobjects")
        end, { desc = "Swap next " .. query })
      end
      for key, query in pairs(swap_prev_maps) do
        vim.keymap.set("n", key, function()
          swap.swap_previous(query, "textobjects")
        end, { desc = "Swap prev " .. query })
      end
    end,
  },
}
