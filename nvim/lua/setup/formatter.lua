-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      require("formatter.filetypes.lua").stylua,
    },

    go = {
      require("formatter.filetypes.go").gofmt,
    },

    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },

    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },

    terraform = {
      require("formatter.filetypes.terraform").terraformfmt,
    },

    python = {
      require("formatter.filetypes.python").black,
    },

    -- yaml = {
    --   require("formatter.filetypes.yaml").pyaml,
    -- },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    -- ["*"] = {
    --   -- "formatter.filetypes.any" defines default configurations for any
    --   -- filetype
    --   require("formatter.filetypes.any").remove_trailing_whitespace,
    -- },
  },
}

vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]]
