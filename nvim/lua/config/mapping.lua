local mode = require("config.consts").modes

vim.g.mapleader = ","

-- No highlight
vim.keymap.set(
  mode.normal,
  "<leader><CR>",
  ":nohlsearch<CR>",
  { noremap = true }
)

-- Copy/paste
vim.keymap.set(mode.visual_select, "<leader>c", '"*yy<CR>', { noremap = true })
vim.keymap.set(mode.normal, "<leader>v", '"+p<CR>', { noremap = true })

-- Tab nav
vim.keymap.set(mode.normal, "<leader>n", "gt", { noremap = true })
vim.keymap.set(mode.normal, "<leader>N", "gT", { noremap = true })
