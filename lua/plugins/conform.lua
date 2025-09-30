return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      -- Bash
      bash = { "shfmt" },
      sh = { "shfmt" },

      -- C/C++
      c = { "clang-format" },
      cpp = { "clang-format" },

      -- CSS/SCSS/Less
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },

      -- Dockerfile
      dockerfile = { "dockerfilelint" },

      -- HTML
      html = { "prettier" },

      -- Java
      java = { "google-java-format" },

      -- JavaScript/TypeScript
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },

      -- JSON
      json = { "prettier" },
      jsonc = { "prettier" },

      -- Lua
      lua = { "stylua" },

      -- Markdown
      markdown = { "prettier" },

      -- PHP
      php = { "php-cs-fixer" },

      -- PowerShell
      ps1 = { "powershell" },

      -- Python
      python = { "black", "isort" },

      -- Ruby
      ruby = { "rubocop" },

      -- SQL
      sql = { "sql-formatter" },

      -- Systemd
      systemd = {},

      -- Terraform
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },

      -- YAML
      yaml = { "prettier" },

      -- Vue
      vue = { "prettier" },
    },
    format_on_save = {
      -- Enable format on save (optional)
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
