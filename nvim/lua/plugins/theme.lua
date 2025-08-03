return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        cmp = true,
        fzf = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        mason = true,
        markdown = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    config = function()
      -- Load the colorscheme
      vim.cmd [[colorscheme catppuccin]]
    end,
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("lualine").setup {
        options = {
          theme = "catppuccin",
        },
        extensions = { "nvim-tree" },
      }
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
    },
  },

  -- colorize hex codes
  -- {
  --   "catgoose/nvim-colorizer.lua",
  --   event = "BufReadPre",
  --   config = function()
  --     require("colorizer").setup()
  --   end,
  -- },
}
