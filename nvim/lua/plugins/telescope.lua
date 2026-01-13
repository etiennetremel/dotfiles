return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }
      require("telescope").load_extension "undo"
      require("telescope").load_extension "fzf"
    end,
  },
}
