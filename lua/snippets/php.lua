local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- PHP Constructor
  s("cons", {
    t { "public function __construct(" },
    i(1),
    t { ") {", "\t" },
    i(0),
    t { "", "}" },
  }),

  -- PHP Array
  s("arr", {
    t "$",
    i(1, "array"),
    t " = [",
    i(2),
    t "]",
    i(0),
  }),

  -- PHP foreach loop
  s("fore", {
    t "foreach ($",
    i(1, "array"),
    t " as ",
    i(2, "$item"),
    t { ") {", "\t" },
    i(0),
    t { "", "}" },
  }),

  -- PHP if statement
  s("if", {
    t "if (",
    i(1, "condition"),
    t { ") {", "\t" },
    i(0),
    t { "", "}" },
  }),

  -- PHP Interface
  s("interface", {
    t "interface ",
    i(1, "InterfaceName"),
    t { " {", "\t" },
    i(0),
    t { "", "}" },
  }),

  -- PHP public method
  s("pub", {
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
  s("priv", {
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
