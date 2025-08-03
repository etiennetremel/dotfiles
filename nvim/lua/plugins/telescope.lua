return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    keys = {
      { "<leader>b", ":Telescope buffers<CR>" },
      { "<leader>s", ":Telescope grep_string<CR>" },
      { "<leader>f", ":Telescope live_grep<CR>" },
      { "<leader>p", ":Telescope find_files hidden=true<CR>" },
      { "<leader>u", ":Telescope undo<CR>" },

      -- backward compatibility with Gundo
      { "<F5>", ":Telescope undo<CR>" },
    },
    config = function()
      require("telescope").setup {
        defaults = {
          layout_strategy = "bottom_pane",
          file_ignore_patterns = {
            ".embuild/.*",
            ".git/.*",
            "Cargo.lock",
            "__pycache__",
            "cargo.lock",
            "dist-types/.*",
            "dist/.*",
            "go.sum",
            "node_modules",
            "terraform.d",
            "yarn.lock",
          },
        },
        extensions = {
          undo = {},
        },
      }
      require("telescope").load_extension "undo"
    end,
  },
  {
    event = "VeryLazy",
    "nvim-telescope/telescope-fzf-native.nvim",
    config = function()
      local telescope = require "telescope"

      telescope.setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }

      telescope.load_extension "fzf"
    end,
    build = "make",
  },
}
