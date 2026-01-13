return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  config = function()
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

        css = {
          require("formatter.filetypes.css").prettier,
        },

        go = {
          require("formatter.filetypes.go").gofmt,
        },

        html = {
          require("formatter.filetypes.html").prettier,
        },

        svelte = {
          require("formatter.defaults").biome,
        },

        -- Disabled for now, using rustacean
        -- rust = {
        --   function()
        --     return {
        --       exe = "cargo",
        --       args = { "fmt" },
        --       stdin = true,
        --     }
        --   end,
        -- },
        --
        typescript = {
          require("formatter.filetypes.typescript").biome,
        },

        typescriptreact = {
          require("formatter.filetypes.typescriptreact").biome,
        },

        terraform = {
          require("formatter.filetypes.terraform").terraformfmt,
        },

        python = {
          require("formatter.filetypes.python").black,
        },

        toml = {
          require("formatter.filetypes.toml").taplo,
        },

        yaml = {
          function()
            return {
              exe = "yamlfmt",
              args = {
                "-formatter retain_line_breaks=true",
                "-in",
              },
              stdin = true,
            }
          end,
        },

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
  end,
}
