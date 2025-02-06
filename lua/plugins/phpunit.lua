-- This is to allow running test in a docker container.
-- I haven't found a way to run test using the neotest-phpunit plugin
-- inside a docker container.
return {
  "nvim-lua/plenary.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local function docker_phpunit_command()
      return "docker exec php ./vendor/bin/phpunit"
    end

    -- Function to get the test method name at cursor
    local function get_test_method_at_cursor()
      local line_nr = vim.fn.line "."
      local current_line = vim.fn.getline(line_nr)

      -- Search upward for the test method
      while line_nr > 0 do
        local line = vim.fn.getline(line_nr)
        local test_method = line:match "%s*public%s+function%s+(test[%w_]+)%("
        if test_method then
          return test_method
        end
        line_nr = line_nr - 1
      end
      return nil
    end

    -- Function to run the nearest test
    local function run_nearest_test()
      local test_method = get_test_method_at_cursor()
      local file_path = vim.fn.expand "%"
      file_path = file_path:gsub("^api/", "")

      local cmd_parts = { docker_phpunit_command() }

      if test_method then
        local escaped_test_method = test_method:gsub("([][(){}.*+?^$|])", "%%%1")
        table.insert(cmd_parts, vim.fn.shellescape(file_path))
        table.insert(cmd_parts, "--filter=" .. vim.fn.shellescape(escaped_test_method) .. "")
        table.insert(cmd_parts, "--no-coverage")
        table.insert(cmd_parts, "--colors=always")
        table.insert(cmd_parts, "--testdox")
        table.insert(cmd_parts, "--process-isolation")
      else
        table.insert(cmd_parts, vim.fn.shellescape(file_path))
      end

      local cmd = table.concat(cmd_parts, " ")

      vim.cmd "vsplit"
      vim.cmd("terminal " .. cmd)
    end

    -- Function to run all tests in current file
    local function run_file_tests()
      local file_path = vim.fn.expand "%"
      local cmd = docker_phpunit_command() .. " " .. file_path .. " --no-coverage --colors=always --testdox"
      vim.cmd "vsplit"
      vim.cmd("terminal " .. cmd)
    end

    -- Create an autocommand group
    local augroup = vim.api.nvim_create_augroup("PHPUnit", { clear = true })

    -- Set up keymaps only for PHP files
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      pattern = "php",
      callback = function()
        -- Key mappings with descriptions for which-key
        vim.keymap.set("n", "<leader>tr", run_nearest_test, { desc = "Run Nearest (PHPUnit)" })
        vim.keymap.set("n", "<leader>tt", run_file_tests, { desc = "Run File (PHPUnit)" })
      end,
    })
  end,
}
