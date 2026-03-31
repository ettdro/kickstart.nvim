vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.editorconfig = true

vim.o.updatetime = 250
vim.o.relativenumber = true
vim.o.number = true
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.wrap = false
vim.o.virtualedit = "block"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.swapfile = false
vim.o.scrolloff = 999
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true
vim.o.winborder = "rounded"

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99 -- open all folds by default
vim.o.foldlevelstart = 99

vim.o.jumpoptions = "view"
vim.o.formatoptions = "qjl1"
vim.o.splitkeep = "screen"
vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m"

vim.diagnostic.config { virtual_text = { current_line = true } }
