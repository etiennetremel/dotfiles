local mode = require("consts").modes
local map = require("utils").map

vim.g.mapleader = ","

-- Toggle spelling
map(mode.visual_select, "<leader>ss", '"spell!<CR>')

-- No highlight
map(mode.normal, "<leader><CR>", ":nohlsearch<CR>")

-- Diffview
map(mode.normal, "<leader>g", ":DiffviewOpen<CR>")

-- Copy/paste
map(mode.visual_select, "<leader>c", '"*yy<CR>')
map(mode.normal, "<leader>v", '"+p<CR>')

-- Comments
map(
  mode.visual_select,
  "<leader>c<space>",
  "<Plug>(comment_toggle_linewise_visual)"
)
map(mode.normal, "<leader>c<space>", "<Plug>(comment_toggle_linewise_current)")

-- Tab nav
map(mode.normal, "<leader>n", "gt")
map(mode.normal, "<leader>N", "gT")

-- Gundo
map(mode.normal, "<F5>", ":GundoToggle<CR>")

-- Telescope
map(mode.normal, "<leader>p", ":Telescope find_files hidden=true<CR>")
map(mode.normal, "<leader>f", ":Telescope live_grep<CR>")
map(mode.normal, "<leader>s", ":Telescope grep_string<CR>")
map(mode.normal, "<leader>b", ":Telescope buffers<CR>")
map(mode.normal, "<leader>h", ":Telescope help_tags<CR>")

-- Nvim Tree
map(mode.normal, "<leader>nn", ":NvimTreeToggle<CR>")
map(mode.normal, "<leader>nf", ":NvimTreeFindFileToggle<CR>")

-- ZenMode
map(mode.normal, "<leader>z", ":ZenMode<CR>")

-- NeoTest
-- map(mod.normal, "<leader>t", "")
