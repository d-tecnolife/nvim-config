local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- config
vim.g.mapleader = ","
vim.opt.clipboard:append { "unnamedplus" }
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', '<Esc>', '<nop>')
vim.opt.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

  -- lazy setup
require("lazy").setup({

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "typescript", "html", "css", "json", "vim", "vimdoc" },
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      })
    end,
  },

  -- telescope  + fzf +  plenary 
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  -- devicons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- nvim-tree
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
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', 'C', api.tree.change_root_to_node, { buffer = bufnr, noremap = true })
        vim.keymap.set('n', '<Space>', api.node.open.edit, { buffer = bufnr, noremap = true })
        end,
    })
    end,
  },
  
  -- colorscheme
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme nightfly")
    end,
  }, 

  -- lazy.nvim settings

  ui = {
    title = "Plugins",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})

vim.keymap.set("n", "tt", function()
      require("nvim-tree.api").tree.toggle()
    end, { desc = "Toggle file explorer" })
