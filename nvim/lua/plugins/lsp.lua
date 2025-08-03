return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    {
      "mason-org/mason-lspconfig.nvim",
      dependencies = "mason-org/mason.nvim",
    },
    "mason-org/mason.nvim",
    "ray-x/lsp_signature.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "folke/which-key.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "eslint",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "pyright",
        "terraformls",
        "ts_ls",
      },
    }

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = {
              "vim",
              "require",
            },
          },
        },
      },
    })
  end,
}
