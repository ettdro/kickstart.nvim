return {
  -- "pmizio/typescript-tools.nvim",
  -- dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  -- ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  -- config = function()
  --   require("typescript-tools").setup {
  --     on_attach = function(client, bufnr)
  --       client.server_capabilities.documentFormattingProvider = false
  --       client.server_capabilities.documentRangeFormattingProvider = false
  --     end,
  --     filetypes = {
  --       "javascript",
  --       "javascriptreact",
  --       "typescript",
  --       "typescriptreact",
  --       "vue",
  --     },
  --     settings = {
  --       expose_as_code_action = { "all" },
  --       tsserver_plugins = {
  --         "@vue/typescript-plugin",
  --       },
  --       tsserver_file_preferences = function(ft)
  --         return {
  --           includeInlayParameterNameHints = "all",
  --           includeCompletionsForModuleExports = true,
  --           quotePreference = "auto",
  --         }
  --       end,
  --       tsserver_format_options = function(ft)
  --         return {
  --           allowIncompleteCompletions = false,
  --           allowRenameOfImportPath = false,
  --         }
  --       end,
  --     },
  --   }
  -- end,
}
