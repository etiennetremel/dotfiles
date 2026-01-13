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

    -- Add an LspAttach autocmd to set keybindings when LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(args)
        local opts = { buffer = args.buf, silent = true }

        -- Navigation
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

        -- Information
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end,
    })
  end,
}
