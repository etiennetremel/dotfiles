require('mason').setup()
require('mason-lspconfig').setup {
  automatic_installation = {}
}

require('mason-lspconfig').setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require('lspconfig')[server_name].setup(require('setup.lsp.config'))
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ['rust_analyzer'] = function ()
        require('rust-tools').setup {}
    end,
    ['lua_ls'] = function ()
        require('lspconfig').lua_ls.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = {'vim'}
              }
            }
          }
        }
    end
}
