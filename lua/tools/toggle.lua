local function toggle()
  local line = vim.api.nvim_get_current_line()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local col = cursor_pos[2] + 1 -- Convert to 1-indexed

  -- Debug: Print current line and cursor position
  -- print("Line: " .. line)
  -- print("Cursor col: " .. col)

  -- Simple word toggles (existing functionality)
  local simple_toggles = {
    ["true"] = "false",
    ["1"] = "0",
  }

  -- Bidirectional regex-based toggles
  local regex_toggles = {
    -- Laravel where/whereIn toggle
    {
      patterns = {
        {
          match = "where%('([^']+)',%s*([^)]+)%)",
          replace = {
            "whereIn('%1', [%2])",
            "whereNotIn('%1', [%2])",
            "whereNull('%1')",
            "whereNotNull('%1')",
            "orWhere('%1', %2)",
          },
        },
      },
    },
    -- Laravel relationship toggles - Fixed patterns
    {
      patterns = {
        {
          match = "hasOne%(([^)]+)%)",
          replace = {
            "hasMany(%1)",
            "belongsTo(%1)",
            "belongsToMany(%1)",
          },
        },
        {
          match = "hasMany%(([^)]+)%)",
          replace = {
            "hasOne(%1)",
            "belongsTo(%1)",
            "belongsToMany(%1)",
          },
        },
        {
          match = "belongsTo%(([^)]+)%)",
          replace = {
            "hasOne(%1)",
            "hasMany(%1)",
            "belongsToMany(%1)",
          },
        },
        {
          match = "belongsToMany%(([^)]+)%)",
          replace = {
            "hasOne(%1)",
            "hasMany(%1)",
            "belongsTo(%1)",
          },
        },
      },
    },
    -- Add more bidirectional patterns here as needed
    {
      patterns = {
        {
          match = "with%(([^)]+)%)",
          replace = {
            "with([%1 => function ($query) {}])",
          },
        },
      },
    },
  }

  -- First try simple word toggles
  local cword = vim.fn.expand "<cword>"
  local newWord
  for word, opposite in pairs(simple_toggles) do
    if cword == word then
      newWord = opposite
      break
    end
    if cword == opposite then
      newWord = word
      break
    end
  end

  if newWord then
    local prevCursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd.normal { '"_ciw' .. newWord, bang = true }
    vim.api.nvim_win_set_cursor(0, prevCursor)
    return
  end

  -- Try regex-based toggles
  for _, toggle_group in ipairs(regex_toggles) do
    for _, toggle_rule in ipairs(toggle_group.patterns) do
      local start_pos, end_pos = string.find(line, toggle_rule.match)

      if start_pos and end_pos then
        -- Check if cursor is within the matched range
        if col >= start_pos and col <= end_pos then
          local function apply_replacement(replacement_pattern)
            local new_line = string.gsub(line, toggle_rule.match, replacement_pattern, 1)

            -- Update the line
            vim.api.nvim_set_current_line(new_line)

            -- Try to maintain cursor position relative to the change
            local length_diff = #new_line - #line
            local new_col = math.max(0, col + length_diff - 1) -- Convert back to 0-indexed
            vim.api.nvim_win_set_cursor(0, { cursor_pos[1], new_col })
          end

          -- Check if replacement is a table (multiple options) or string (single option)
          if type(toggle_rule.replace) == "table" then
            -- Multiple options - show UI selection
            local options = {}
            for i, replacement in ipairs(toggle_rule.replace) do
              -- Preview what the replacement would look like
              local preview = string.gsub(line, toggle_rule.match, replacement, 1)
              table.insert(options, preview)
            end

            vim.ui.select(options, {
              prompt = "Select replacement:",
              format_item = function(item)
                return item
              end,
            }, function(choice, idx)
              if choice and idx then
                apply_replacement(toggle_rule.replace[idx])
              end
            end)
          else
            -- Single option - apply directly
            apply_replacement(toggle_rule.replace)
          end
          return
        end
      end
    end
  end

  -- If no toggle was found, you could optionally show a message
  -- print("No toggle pattern found for current position")
end

vim.keymap.set("n", "<leader>ct", toggle, { desc = "Toggle current word or pattern" })
