local theme_styles = {
  night = "night",
  day = "day",
  storm = "storm"
}

vim.g.tokyonight_transparent = false
vim.g.tokyonight_style = theme_styles.night
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false

-- Set highlight color when tree sitter context is showing
vim.cmd[[highlight TreesitterContextLineNumber guifg=#c3e88d]] 

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]

return theme_styles
