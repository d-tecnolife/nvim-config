return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          
          -- load default keymappings
          api.config.mappings.default_on_attach(bufnr)
          
          -- custom keymappings
          vim.keymap.set("n", "C", api.tree.change_root_to_node, {
            buffer = bufnr,
            noremap = true,
            desc = "CD to node",
          })
          vim.keymap.set("n", "<Space>", api.node.open.edit, {
            buffer = bufnr,
            noremap = true,
            desc = "Open file",
          })
        end,
      })
    end,
  },
}
