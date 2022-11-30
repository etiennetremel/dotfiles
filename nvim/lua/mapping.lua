local mode = require("consts").modes
local map = require("utils").map

vim.g.mapleader = ","

-- Toggle spelling
map(mode.visual_select, "<leader>ss", '"spell!<CR>')

-- No highlight
map(mode.normal, "<leader><CR>", ':nohlsearch<CR>')

-- Copy/paste
map(mode.visual_select, '<leader>c', '"*yy<CR>')
map(mode.normal, '<leader>v', '"+p<CR>')

-- Tab nav
map(mode.normal, "<leader>n", "gt")
map(mode.normal, "<leader>N", "gT")

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
