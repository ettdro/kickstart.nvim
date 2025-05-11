local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
  require "config.vscode.options"
  require "config.vscode.keymaps"
  require "config.vscode.autocmds"
else
  require "config.options"
  require "config.keymaps"
  require "config.autocmds"
end

require("lazy").setup {
  {
    import = "plugins.common",
    cond = true,
  },
  {
    import = "plugins.native",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.vscode",
    cond = function()
      return vim.g.vscode
    end,
  },
}

if not vim.g.vscode then
  require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/lua/snippets" }
end
