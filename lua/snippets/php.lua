local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Function to get filename without extension
local function get_filename()
  local filename = vim.fn.expand "%:t:r"
  return filename ~= "" and filename or "ClassName"
end

return {
  s("phpclass", {
    t "<?php declare(strict_types=1);",
    t { "", "" },
    t { "", "" },
    t "class ",
    f(get_filename, {}),
    i(1),
    t { "", "{" },
    t { "", "    " },
    i(0),
    t { "", "}" },
  }),
  -- PHP Constructor
  s("phpcons", {
    t { "public function __construct(" },
    i(1),
    t { ") {", "\t" },
    i(0),
    t { "", "}" },
  }),

  -- PHP Array
  s("phparr", {
    t "$",
    i(1, "array"),
    t " = [",
    i(2),
    t "]",
    i(0),
  }),

  -- PHP foreach loop
  s("phpfore", {
    t "foreach ($",
    i(1, "array"),
    t " as ",
    i(2, "$item"),
    t { ") {", "\t" },
    i(0),
    t { "", "}" },
  }),

  -- PHP if statement
  s("phpif", {
    t "if (",
    i(1, "condition"),
    t { ") {", "\t" },
    i(0),
    t { "", "}" },
  }),

  -- PHP Interface
  s("phpinterface", {
    t "interface ",
    i(1, "InterfaceName"),
    t { " {", "\t" },
    i(0),
    t { "", "}" },
  }),

  -- PHP public method
  s("phppub", {
    t "public function ",
    i(1, "methodName"),
    t "(",
    i(2),
    t "): ",
    i(3, "void"),
    t { " {", "\t" },
    i(0),
    t { "", "}" },
  }),

  -- PHP private method
  s("phppriv", {
    t "private function ",
    i(1, "methodName"),
    t "(",
    i(2),
    t "): ",
    i(3, "void"),
    t { " {", "\t" },
    i(0),
    t { "", "}" },
  }),
}
