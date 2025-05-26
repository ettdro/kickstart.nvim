return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "bash",
        "blade",
        "c",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "nginx",
        "php",
        "php_only",
        "python",
        "query",
        "regex",
        "scss",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["a="] = "@assignment.outer",
            ["i="] = "@assignment.inner",
            ["l="] = "@assignment.lhs",
            ["r="] = "@assignment.rhs",
            ["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
            ["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
            ["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
            ["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["ii"] = "@conditional.inner",
            ["ai"] = "@conditional.outer",
            ["il"] = "@loop.inner",
            ["al"] = "@loop.outer",
            ["as"] = "@statement.outer",
            ["is"] = "@statement.inner",
            ["a/"] = "@comment.outer",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
          },
          goto_next = {
            ["]i"] = "@conditional.inner",
          },
          goto_previous = {
            ["[i"] = "@conditional.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>csa"] = "@parameter.inner",
            ["<leader>csp"] = "@proptrueerty.outer", -- swap object property with next
          },
          swap_previous = {
            ["<leader>csA"] = "@parameter.inner",
            ["<leader>csP"] = "@property.outer", -- swap object property with next
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      enable = vim.g.vscode ~= true,
      max_lines = 2,
      multiline_threshold = 2,
    },
  },
}
