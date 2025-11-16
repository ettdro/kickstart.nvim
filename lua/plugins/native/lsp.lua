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

      local lsp_enable = function(name, opts)
        opts = opts or {}
        opts.capabilities = vim.tbl_deep_extend("force", capabilities, opts.capabilities or {})
        vim.lsp.enable(name, opts)
      end

      local lsp_servers = {
        vue_ls = {
          filetypes = { "vue" },
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
        },
        ts_ls = {},
        intelephense = {
          filetypes = { "php" },
          settings = {
            intelephense = {
              files = {
                maxSize = 1000000,
              },
            },
          },
        },
        lua_ls = {
          filetypes = { "lua" },
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        pyright = {
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
        },
      }

      for name, opts in pairs(lsp_servers) do
        vim.lsp.config(name, opts)
        lsp_enable(name, opts)
      end
    end,
  },
}
