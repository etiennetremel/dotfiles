local mode = require("consts").modes

vim.g.mapleader = ","

-- Toggle spelling
vim.keymap.set(
  mode.visual_select,
  "<leader>ss",
  '"spell!<CR>',
  { noremap = true }
)

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

-- Comments
vim.keymap.set(
  mode.visual_select,
  "<leader>c<space>",
  "<Plug>(comment_toggle_linewise_visual)",
  { noremap = true }
)
vim.keymap.set(
  mode.normal,
  "<leader>c<space>",
  "<Plug>(comment_toggle_linewise_current)",
  { noremap = true }
)

-- Tab nav
vim.keymap.set(mode.normal, "<leader>n", "gt", { noremap = true })
vim.keymap.set(mode.normal, "<leader>N", "gT", { noremap = true })

-- Gundo
vim.keymap.set(mode.normal, "<F5>", ":GundoToggle<CR>", { noremap = true })

-- GitSign
vim.keymap.set(
  mode.normal,
  "<leader>d",
  ":Gitsigns diffthis<CR>",
  { noremap = true }
)
vim.keymap.set(mode.normal, "<leader>q", ":bd<CR>", { noremap = true })

-- Telescope
vim.keymap.set(
  mode.normal,
  "<leader>p",
  ":Telescope find_files hidden=true<CR>",
  { noremap = true }
)
vim.keymap.set(
  mode.normal,
  "<leader>f",
  ":Telescope live_grep<CR>",
  { noremap = true }
)
vim.keymap.set(
  mode.normal,
  "<leader>s",
  ":Telescope grep_string<CR>",
  { noremap = true }
)
vim.keymap.set(
  mode.normal,
  "<leader>b",
  ":Telescope buffers<CR>",
  { noremap = true }
)

-- Nvim Tree
vim.keymap.set(
  mode.normal,
  "<leader>nn",
  ":NvimTreeToggle<CR>",
  { noremap = true }
)
vim.keymap.set(
  mode.normal,
  "<leader>nf",
  ":NvimTreeFindFileToggle<CR>",
  { noremap = true }
)

vim.keymap.set(
  mode.normal,
  "<leader>k",
  '<cmd>lua require("kubectl").toggle()<cr>',
  { noremap = true, silent = true }
)

-- ZenMode
vim.keymap.set(mode.normal, "<leader>z", ":ZenMode<CR>", { noremap = true })
