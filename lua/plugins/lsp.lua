return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require "lspconfig"
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { buffer = bufnr, desc = "Format" })
      end

      lspconfig.intelephense.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        keys = {},
      }

      -- Setup lua_ls
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
        keys = {},
      }

      lspconfig.volar.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        -- filetypes = { "vue" },
        -- init_options = {
        --   typescript = {
        --     tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
        --   },
        --   vue = {
        --     hybridMode = false, -- Enable hybrid mode
        --   },
        --   languageFeatures = {
        --     references = true,
        --     implementation = true,
        --     definition = true,
        --     typeDefinition = true,
        --     callHierarchy = true,
        --     hover = true,
        --     rename = true,
        --     renameFileRefactoring = true,
        --     signatureHelp = true,
        --     codeAction = true,
        --     workspaceSymbol = true,
        --     completion = {
        --       defaultTagNameCase = "kebab",
        --       defaultAttrNameCase = "kebab",
        --       getDocumentNameCasesRequest = false,
        --       getDocumentSelectionRequest = false,
        --     },
        --   },
        -- },
        keys = {},
      }

      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "vue"),
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          on_attach(client, bufnr)
        end,
        single_file_support = true,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "spec.ts",
          "test.ts",
        },
        init_options = {
          typescript = {
            tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
          },
        },
        -- Use the appropriate `tsconfig.json` to prevent unnecessary reloads
        settings = {
          typescript = {
            tsconfig = "tsconfig.json", -- Ensure it points to your actual tsconfig.json
          },
        },
        keys = {},
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true,
    opts = {
      ensure_installed = {
        "intelephense",
        "vue-language-server",
        "typescript-language-server",
        "prettier",
        "eslint-lsp",
        "json-lsp",
        "css-lsp",
        "html-lsp",
        "lua_ls",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ts_ls",
        "intelephense",
        "vls",
        "lua_ls",
      },
    },
  },
}
