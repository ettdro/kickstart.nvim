return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      format_after_save = {
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        php = { "prettier" },
        vue = { "prettier" },
        typescript = { "prettier" },
        javascript = { "prettier" },
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
            if string.find(path, "clearestate") then
              return "client/node_modules/prettier/bin-prettier.js"
            end
            return "prettier"
          end,
          prepend_args = function(self, ctx)
            local path = vim.fn.getcwd()
            local client_path = string.find(path, "api") and string.gsub(path, "api", "client") or path

            -- Add configuration
            local args = {}

            -- Check if config file exists
            local config_file = path .. "/prettier.config.js"
            if vim.fn.filereadable(config_file) == 1 then
              table.insert(args, "--config=" .. config_file)
            end

            return args
          end,
        },
      },
    },
  },
}
