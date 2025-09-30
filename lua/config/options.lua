-- leader key
vim.g.mapleader = ","

-- general options
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.clipboard:append({ "unnamedplus" })

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- disable netrw (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
