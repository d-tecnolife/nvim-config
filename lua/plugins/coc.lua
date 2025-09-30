return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.updatetime = 300
    vim.opt.signcolumn = "yes"

    -- tab keymaps for completion
    local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
    vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', opts)
    vim.keymap.set("i", "<S-TAB>", 'coc#pum#visible() ? coc#pum#prev(1) : "<S-TAB>"', opts)
    vim.keymap.set("i", "<CR>", 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', opts)

    -- keymaps
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
    vim.keymap.set("n", "K", function()
      if vim.fn.CocAction('hasProvider', 'hover') then
        vim.fn.CocActionAsync('doHover')
      end
    end, {silent = true})
    
    vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})
  end,
}
