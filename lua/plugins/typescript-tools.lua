return {
  -- "pmizio/typescript-tools.nvim",
  -- dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  -- opts = {},
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
  --         -- Some "ifology" using `ft` of opened file
  --         return {
  --           includeInlayParameterNameHints = "all",
  --           includeCompletionsForModuleExports = true,
  --           quotePreference = "auto",
  --         }
  --       end,
  --       tsserver_format_options = function(ft)
  --         -- Some "ifology" using `ft` of opened file
  --         return {
  --           allowIncompleteCompletions = false,
  --           allowRenameOfImportPath = false,
  --         }
  --       end,
  --     },
  --   }
  -- end,
}
