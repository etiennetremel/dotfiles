-- autocompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- auto bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- setup file
local function get_setup(name)
  return string.format('require("setup.%s")', name)
end

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  -- The Basics
  use {
    'preservim/nerdcommenter',
    config = get_setup('nerdcommenter')
  }

  -- Bottom line
  use {
    'nvim-lualine/lualine.nvim',
    config = get_setup('lualine'),
    requires = {
      'nvim-tree/nvim-web-devicons',
      {
        'folke/tokyonight.nvim',
        config = get_setup('colorscheme')
      }
    }
  }

  -- icons
  use {
    'ryanoasis/vim-devicons',
    config = get_setup('vim_devicons')
  }

  -- file tree
  use {
    "nvim-tree/nvim-tree.lua",
    config = get_setup("nvim_tree")
  }

  -- auto close opening brackets
  use {
    "windwp/nvim-autopairs",
    config = get_setup('autopairs')
  }

  -- search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = get_setup('telescope')
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    config = get_setup('telescope_fzf_native'),
    run = 'make'
  }

  -- git diff
  use {
    'sindrets/diffview.nvim',
    config = get_setup('diffview'),
    requires = 'nvim-lua/plenary.nvim'
  }

  -- git visual feedback
  use {
    'airblade/vim-gitgutter',
    config = get_setup('gitgutter')
  }

  -- undo history
  use {
    'sjl/gundo.vim',
    config = get_setup('gundo')

  }

  -- trailing whitespacs
  use {
    'ntpeters/vim-better-whitespace',
    config = get_setup('better_whitespace')
  }

  -- Zen
  use {
    'folke/zen-mode.nvim',
    config = get_setup('zen_mode')
  }

  -- Scroll direction visual feedback
  use {
    'gen740/SmoothCursor.nvim',
    config = get_setup('smoothcursor')
  }

  -- Colorscheme
  use {
    'folke/tokyonight.nvim',
    config = get_setup('colorscheme')
  }

  -- Which-key
  use { 'folke/which-key.nvim' }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    opt = true,
    event = 'BufReadPost',
    wants = {
      'cmp-nvim-lsp',
      'nvim-lsp-installer',
      'lsp_signature.nvim'
    },
    config = get_setup('lsp.config'),
    requires = {
      'williamboman/nvim-lsp-installer',
      'ray-x/lsp_signature.nvim',
    },
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    config = get_setup('cmp'),
    requires = {
      {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
      {'hrsh7th/cmp-path', after = 'nvim-cmp'},
      {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'},
      {'ray-x/cmp-treesitter', after = 'nvim-cmp'},
      {'hrsh7th/cmp-cmdline', after = 'nvim-cmp'},
      {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'},
      {
        'L3MON4D3/LuaSnip',
        wants = 'friendly-snippets',
        after = 'nvim-cmp',
        config = get_setup('luasnip'),
      },
      {'rafamadriz/friendly-snippets', after = 'nvim-cmp'},
    },
  }

  -- LSP Support
  -- use { 'VonHeikemen/lsp-zero.nvim' }
  -- use { 'williamboman/nvim-lsp-installer' }
  -- -- use { 'ray-x/lsp_signature.nvim' } -- show functions signature
  -- use {
  --   'neovim/nvim-lspconfig',
  --   config = get_setup('lsp')
  -- }

  -- Autocompletion
  -- use { 'hrsh7th/nvim-cmp' }
  -- use { 'hrsh7th/cmp-buffer' }
  -- use { 'hrsh7th/cmp-path' }
  -- use { 'saadparwaiz1/cmp_luasnip' }
  -- use { 'hrsh7th/cmp-nvim-lsp' }
  -- use { 'hrsh7th/cmp-nvim-lua' }

  -- Snippets
  -- use { 'L3MON4D3/LuaSnip' }
  -- use { 'rafamadriz/friendly-snippets' }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = get_setup('treesitter')
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = get_setup('treesitter_context')
  }

  -- Tmux navigation
  use {
    'alexghergh/nvim-tmux-navigation',
    config = get_setup('tmux_navigation')
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
