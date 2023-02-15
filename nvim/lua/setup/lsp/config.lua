local cmp = require "cmp_nvim_lsp"
local keymaps = require "setup.lsp.keymaps"
local lsp_signature = require "lsp_signature"

local opts = {
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(
      bufnr,
      "formatexpr",
      "v:lua.vim.lsp.formatexpr()"
    )

    keymaps.setup(client, bufnr)
  end,

  capabilities = cmp.default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  flags = {
    debounce_text_changes = 150,
  },
}

lsp_signature.setup {
  bind = true,
  handler_opts = {
    border = "rounded",
  },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "double",
})

return opts
