-- general keymaps
vim.keymap.set('i', 'jk', '<Esc>', { desc = "Exit insert mode" })
vim.keymap.set('i', '<Esc>', '<nop>', { desc = "Disable Esc in insert mode" })

-- fold keymaps
vim.keymap.set('n', 'zx', 'zA', { noremap = true, silent = true, desc = 'Toggle fold recursively' })

-- file explorer toggle
vim.keymap.set("n", "tt", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle file explorer" })
