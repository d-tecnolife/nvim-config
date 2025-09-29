local vim = vim
local Plug = vim.fn['plug#']

-- autoload 
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
  vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  vim.o.runtimepath = vim.o.runtimepath
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

vim.call('plug#begin')

-- telescope
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('nvim-telescope/telescope-fzf-native.nvim')

-- fzf
Plug('junegunn/fzf', { ['do'] = function() vim.fn['fzf#install']() end })
Plug('junegunn/fzf.vim')

-- devicons
Plug('nvim-tree/nvim-web-devicons')

-- colorschemes
Plug('bluz71/vim-nightfly-colors', { ['as'] = 'nightfly' })

vim.call('plug#end')

-- load colorscheme
vim.cmd('silent! colorscheme nightfly')

-- config
vim.g.mapleader = ","
vim.opt.clipboard:append { "unnamedplus" }
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', '<Esc>', '<nop>')
vim.opt.number = true

-- telescope config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
