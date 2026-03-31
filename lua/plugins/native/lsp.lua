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
      -- Apply blink.cmp capabilities to all servers globally.
      -- mason-lspconfig auto-enables servers via nvim-lspconfig defaults,
      -- so manual vim.lsp.enable() calls are not needed.
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      -- Per-server overrides (only settings that differ from nvim-lspconfig defaults)
      -- vim.lsp.config("vtsls", {
      --   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      --   settings = {
      --     vtsls = {
      --       autoUseWorkspaceTsdk = true,
      --       tsserver = {
      --         globalPlugins = {
      --           {
      --             name = "@vue/typescript-plugin",
      --             location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin",
      --             languages = { "vue" },
      --             configNamespace = "typescript",
      --             enableForWorkspaceTypeScriptVersions = true,
      --           },
      --         },
      --       },
      --     },
      --   },
      -- })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = { vim.fn.stdpath "config" },
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("intelephense", {
        settings = {
          intelephense = {
            files = { maxSize = 1000000 },
          },
        },
      })
    end,
  },
}
