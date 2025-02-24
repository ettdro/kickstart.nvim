return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        php = { "prettier" }, -- PHP formatter
        vue = { "prettier" }, -- Vue.js formatting via Prettier
        typescript = { "prettier" }, -- TypeScript formatting via Prettier
        javascript = { "prettier" }, -- JavaScript formatting via Prettier
        json = { "prettier" },
        yaml = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        blade = { "blade-formatter" },
      },
      formatters = {
        prettier = {
          command = function()
            local path = vim.fn.getcwd()
            return string.gsub(path, "api", "client") .. "/node_modules/prettier/bin-prettier.js"
          end,
          args = function()
            local path = vim.fn.getcwd()
            local client_path = string.gsub(path, "api", "client")
            return {
              "--plugin=" .. client_path .. "/node_modules/@prettier/plugin-php",
              "--config",
              vim.fn.getcwd() .. "/prettier.config.js",
              "--stdin-filepath",
              "$FILENAME",
            }
          end,
          stdin = true,
          condition = function(ctx)
            return true
          end,
        },
      },
    },
  },
}
