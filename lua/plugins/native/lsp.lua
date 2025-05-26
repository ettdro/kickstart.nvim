return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    opts = {},
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

      vim.lsp.config("vue_ls", {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      })

      vim.lsp.enable("eslint", {
        settings = {
          filetypes = {
            "javascript",
            "typescript",
            "typescriptreact",
            "javascriptreact",
            "vue",
          },
        },
      })

      vim.lsp.enable("intelephense", {
        filetypes = { "php" },
        settings = {
          intelephense = {
            files = {
              maxSize = 1000000,
            },
          },
        },
      })

      vim.lsp.enable("lua_ls", {
        filetypes = { "lua" },
        settings = {
          Lua = {
            completion = { callSnippet = "Replace" },
          },
        },
      })

      vim.lsp.enable("pyright", {
        filetypes = { "python" },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoImportCompletions = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })
    end,
  },
}
