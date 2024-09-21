local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  -- comments
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require "setup.comment"
    end,
  },

  -- bottom line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require "setup.lualine"
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "folke/tokyonight.nvim",
    },
  },

  -- icons
  {
    "ryanoasis/vim-devicons",
    event = "VeryLazy",
    config = function()
      require "setup.vim_devicons"
    end,
  },

  -- file tree
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "setup.nvim_tree"
    end,
  },

  -- search
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require "setup.telescope"
    end,
  },
  {
    event = "VeryLazy",
    "nvim-telescope/telescope-fzf-native.nvim",
    config = function()
      require "setup.telescope_fzf_native"
    end,
    build = "make",
  },

  -- git diff
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
      require "setup.diffview"
    end,
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- git visual feedback
  {
    "airblade/vim-gitgutter",
    event = "VeryLazy",
    config = function()
      require "setup.gitgutter"
    end,
  },

  -- undo history
  {
    "sjl/gundo.vim",
    event = "VeryLazy",
    config = function()
      require "setup.gundo"
    end,
  },

  -- trailing whitespacs
  {
    "ntpeters/vim-better-whitespace",
    event = "VeryLazy",
    config = function()
      require "setup.better_whitespace"
    end,
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  -- indentation visual feedback
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "┊",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },

  -- Zen
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    config = function()
      require "setup.zen_mode"
    end,
  },

  -- Scroll direction visual feedback
  {
    "gen740/SmoothCursor.nvim",
    event = "VeryLazy",
    config = function()
      require "setup.smoothcursor"
    end,
  },

  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    config = function()
      require "setup.colorscheme"
    end,
  },

  -- auto format
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    config = function()
      require "setup.formatter"
    end,
  },

  -- Which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      { "echasnovski/mini.nvim", version = false },
    },
  },

  -- Test report/coverage
  -- {
  --   "nvim-neotest/neotest",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "haydenmeade/neotest-jest",
  --   },
  --   config = function()
  --     require("neotest").setup {
  --       adapters = {
  --         require "neotest-jest" {
  --           jestCommand = "yarn test",
  --           -- jestConfigFile = "custom.jest.config.ts",
  --           env = { CI = true },
  --           cwd = function(path)
  --             return vim.fn.getcwd()
  --           end,
  --         },
  --       },
  --     }
  --   end,
  -- },

  -- Improved rust experience
  {
    "mrcjkb/rustaceanvim",
    event = "VeryLazy",
    ft = { "rust" },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = "williamboman/mason.nvim",
      },
      "williamboman/mason.nvim",
      "ray-x/lsp_signature.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/which-key.nvim",
    },
    config = function()
      require "setup.mason_lsp"
    end,
  },

  -- GitHub Copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require "setup.copilot"
  --   end,
  -- },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    config = function()
      require "setup.cmp"
    end,
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", dependencies = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help", dependencies = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", dependencies = "nvim-cmp" },
      { "hrsh7th/cmp-path", dependencies = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", dependencies = "nvim-cmp" },
      { "ray-x/cmp-treesitter", dependencies = "nvim-cmp" },
      { "hrsh7th/cmp-vsnip", dependencies = "nvim-cmp" },
      { "hrsh7th/vim-vsnip", dependencies = "nvim-cmp" },
      -- {
      --   "zbirenbaum/copilot-cmp",
      --   dependencies = { "copilot.lua" },
      --   config = function()
      --     require("copilot_cmp").setup()
      --   end,
      -- },

      -- auto close opening brackets
      {
        "windwp/nvim-autopairs",
        config = function()
          require "setup.autopairs"
        end,
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "setup.treesitter"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require "setup.treesitter_context"
    end,
  },

  -- Tmux navigation
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require "setup.tmux_navigation"
    end,
  },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require "setup.todo_comments"
    end,
  },
}
