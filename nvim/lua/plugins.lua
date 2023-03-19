-- autocompile
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

-- auto bootstrap
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

-- setup file
local function get_setup(name)
  return string.format('require("setup.%s")', name)
end

return require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- The Basics
  use {
    "preservim/nerdcommenter",
    config = get_setup "nerdcommenter",
  }

  -- Bottom line
  use {
    "nvim-lualine/lualine.nvim",
    config = get_setup "lualine",
    requires = {
      "nvim-tree/nvim-web-devicons",
      {
        "folke/tokyonight.nvim",
        config = get_setup "colorscheme",
      },
    },
  }

  -- icons
  use {
    "ryanoasis/vim-devicons",
    config = get_setup "vim_devicons",
  }

  -- file tree
  use {
    "nvim-tree/nvim-tree.lua",
    commit = "8b8d457",
    config = get_setup "nvim_tree",
  }

  -- auto close opening brackets
  use {
    "windwp/nvim-autopairs",
    config = get_setup "autopairs",
  }

  -- search
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = get_setup "telescope",
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    config = get_setup "telescope_fzf_native",
    run = "make",
  }

  -- git diff
  use {
    "sindrets/diffview.nvim",
    config = get_setup "diffview",
    requires = "nvim-lua/plenary.nvim",
  }

  -- git visual feedback
  use {
    "airblade/vim-gitgutter",
    config = get_setup "gitgutter",
  }

  -- undo history
  use {
    "sjl/gundo.vim",
    config = get_setup "gundo",
  }

  -- trailing whitespacs
  use {
    "ntpeters/vim-better-whitespace",
    config = get_setup "better_whitespace",
  }

  -- indentation visual feedback
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = get_setup "indent",
  }

  -- Zen
  use {
    "folke/zen-mode.nvim",
    config = get_setup "zen_mode",
  }

  -- Scroll direction visual feedback
  use {
    "gen740/SmoothCursor.nvim",
    config = get_setup "smoothcursor",
  }

  -- Colorscheme
  use {
    "folke/tokyonight.nvim",
    config = get_setup "colorscheme",
  }

  -- auto format
  use {
    "mhartington/formatter.nvim",
    config = get_setup "formatter",
  }

  -- Which-key
  use { "folke/which-key.nvim" }

  -- Improved rust experience
  use { "simrat39/rust-tools.nvim" }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      {
        "williamboman/mason-lspconfig.nvim",
        requires = "williamboman/mason.nvim",
      },
      "williamboman/mason.nvim",
      "ray-x/lsp_signature.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = get_setup "mason_lsp",
  }

  -- GitHub Copilot
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = get_setup "copilot",
  }

  -- Autocompletion
  use {
    "hrsh7th/nvim-cmp",
    config = get_setup "cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "ray-x/cmp-treesitter", after = "nvim-cmp" },
      { "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
      { "hrsh7th/vim-vsnip", after = "nvim-cmp" },
      {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = get_setup "treesitter",
  }
  use {
    "nvim-treesitter/nvim-treesitter-context",
    config = get_setup "treesitter_context",
  }

  -- Tmux navigation
  use {
    "alexghergh/nvim-tmux-navigation",
    config = get_setup "tmux_navigation",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
