return {
  "nvim-tree/nvim-tree.lua",

  keys = {
    { "<leader>nn", ":NvimTreeToggle<CR>" },
    { "<leader>nf", ":NvimTreeFindFileToggle<CR>" },
  },

  config = function()
    local function on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- override default mappings
      vim.keymap.set(
        "n",
        "<CR>",
        api.node.open.no_window_picker,
        opts "Open: No Window Picker"
      )
    end

    require("nvim-tree").setup {
      on_attach = on_attach,
      auto_reload_on_write = true,
      sort_by = "name",
      filters = {
        dotfiles = false,
        custom = {
          "^\\.git$",
          "^\\.yarn$",
          "node_modules",
        },
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
      renderer = {
        icons = {
          show = {
            file = false,
          },
        },
      },
      view = {
        float = {
          enable = true,
          open_win_config = {
            relative = "cursor",
            border = "rounded",
            row = 1,
            col = 1,
          },
        },
        adaptive_size = true,
        centralize_selection = true,
      },
    }
  end,
}
