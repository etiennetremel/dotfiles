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
