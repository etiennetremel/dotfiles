require("tokyonight").setup({
  style = "night",
  styles = {
    comments = { italic = false },
    keywords = { italic = false }
  },
  dim_inactive = true,
  hide_inactive_statusline = false
})

-- Set highlight color when tree sitter context is showing
vim.cmd[[highlight TreesitterContextLineNumber guifg=#c3e88d]]

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
