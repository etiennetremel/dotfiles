require("mason").setup()
require("mason-lspconfig").setup {
  automatic_installation = {},
}

-- local rt = require "rust-tools"

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup(require "setup.lsp.config")
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function()
  --   -- rt.setup {
  --   --   server = {
  --   --     standalone = true,
  --   --     on_attach = function(_, bufnr)
  --   --       -- Hover actions
  --   --       vim.keymap.set(
  --   --         "n",
  --   --         "<K>",
  --   --         rt.hover_actions.hover_actions,
  --   --         { buffer = bufnr }
  --   --       )
  --   --       -- Code action groups
  --   --       -- vim.keymap.set(
  --   --       --   "n",
  --   --       --   "<Leader>a",
  --   --       --   rt.code_action_group.code_action_group,
  --   --       --   { buffer = bufnr }
  --   --       -- )
  --   --     end,
  --   --   },
  --   -- }
  -- end,
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
