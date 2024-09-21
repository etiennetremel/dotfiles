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
    "tsserver",
  },
  automatic_installation = false,
  handlers = nil,
}

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup(require "setup.lsp.config")
  end,
  ["lua_ls"] = function()
    require("lspconfig").lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }
  end,
}
