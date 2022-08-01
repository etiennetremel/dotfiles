local mode = require("consts").modes

local function map(mode, mapping, cmd, options)
  local opts = { noremap = true }
  if options then
    opts = vim.tbl_extend("force", opts, options)
  end
  vim.api.nvim_set_keymap(mode, mapping, cmd, opts)
end

vim.g.mapleader = ","

-- toggle spelling
map(mode.visual_select, '<leader>ss', '"spell!<CR>')

-- copy/paste
map(mode.visual_select, '<leader>c', '"*yy<CR>')
map(mode.normal, '<leader>v', '"+p<CR>')

-- Tab nav
map(mode.normal, "<leader>n", "gt")
map(mode.normal, "<leader>N", "gT")

-- NERDTree
map(mode.normal, "<leader>nn", ":NERDTreeToggle<CR>")
map(mode.normal, "<leader>nn", ":NERDTreeToggle<cr>")
map(mode.normal, "<leader>nb", ":NERDTreeFromBookmark<Space>")
map(mode.normal, "<leader>nf", ":NERDTreeFind<cr>")

-- Pane navigation
-- map(mode.normal, "<C-j>", "<C-w>j")
-- map(mode.normal, "<C-k>", "<C-w>k")
-- map(mode.normal, "<C-l>", "<C-w>l")
-- map(mode.normal, "<C-h>", "<C-w>h")
--
--
-- local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }

-- map(mode.normal, "<C-h>", "<CMD>lua require('Navigator').left()<CR>")
-- map(mode.normal, "<C-k>", "<CMD>lua require('Navigator').up()<CR>")
-- map(mode.normal, "<C-l>", "<CMD>lua require('Navigator').right()<CR>")
-- map(mode.normal, "<C-j>", "<CMD>lua require('Navigator').down()<CR>")
-- map(mode.normal, "<C-p>", "<CMD>lua require('Navigator').previous()<CR>")

-- Equalize pane widths
map(mode.normal, "<leader>=", "<C-W><C-=>")

-- Gundo
map(mode.normal, "<F5>", ":GundoToggle<CR>")

-- Telescope
map(mode.normal, "<leader>p", ":Telescope find_files hidden=true<CR>")
map(mode.normal, "<leader>f", ":Telescope live_grep<CR>")
map(mode.normal, "<leader>s", ":Telescope grep_string<CR>")
map(mode.normal, "<leader>b", ":Telescope buffers<CR>")
map(mode.normal, "<leader>h", ":Telescope help_tags<CR>")

-- ZenMode
map(mode.normal, "<leader>z", ":ZenMode<CR>")

