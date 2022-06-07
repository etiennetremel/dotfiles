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
  use {
    'preservim/nerdtree',
    config = get_setup('nerdtree')
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = get_setup('lualine'),
    requires = {
      'kyazdani42/nvim-web-devicons',
      {
        'folke/tokyonight.nvim',
        config = get_setup('colorscheme')
      }
    }
  }
  use {
    'ryanoasis/vim-devicons',
    config = get_setup('vim_devicons')
  }
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
  use { 'tpope/vim-fugitive' }
  use { 'mcauley-penney/tidy.nvim' } -- trailing whitespaces
  use {
    'airblade/vim-gitgutter',
    config = get_setup('gitgutter')
  }
  use {
    'sjl/gundo.vim',
    config = get_setup('gundo')
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
    -- event = 'BufReadPre',
    wants = { 'cmp-nvim-lsp', 'nvim-lsp-installer', 'lsp_signature.nvim' },
    config = get_setup('lsp.config'),
    requires = {
      'williamboman/nvim-lsp-installer',
      'ray-x/lsp_signature.nvim',
    },
  }

  -- CMP
  use {
    'hrsh7th/nvim-cmp',
    -- event = 'InsertEnter',
    opt = true,
    config = get_setup('cmp'),
    -- wants = { 'LuaSnip' },
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-cmdline',
      -- 'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      -- {
      --   'L3MON4D3/LuaSnip',
      --   wants = 'friendly-snippets',
      --   -- config = get_setup('luasnip'),
      -- },
      'rafamadriz/friendly-snippets',
    },
    disable = false,
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
