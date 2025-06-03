local opts = {
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
}

require("catppuccin").setup(opts)

-- Load the colorscheme
vim.cmd [[colorscheme catppuccin]]
