local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  s("twh", {
    t "const wrapper: WrapperHelper = await WrapperHelperFactory.new()",
    t { "", "  .setComponent(" },
    f(function()
      local filename = vim.fn.expand "%:t:r" -- Get filename without extension
      return filename:gsub("%.spec$", "") -- Remove `.spec` if present
    end, {}),
    t ")",
    t { "", "  .setProps({", "" },
    i(1, "// props here"),
    t { "", "  })" },
    t { "", "  .create();" },
  }),
  s("taa", {
    t "await assert(() => {",
    t { "", "  // assertions here" },
    i(1, ""),
    t { "", "});" },
  }),
}
