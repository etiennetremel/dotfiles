local opt = vim.opt

opt.termguicolors = true

-- Disable netrw in favor of nvim-tree.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.spell = true
opt.swapfile = false
opt.number = true
opt.relativenumber = true
opt.scrolloff = 7
opt.colorcolumn = "80"
opt.cursorline = true
opt.laststatus = 3
opt.foldcolumn = "1"

-- Tab control
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true

opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.formatoptions = "cq"

opt.wildignore = "*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store"
opt.list = true
opt.listchars = "tab:>-"
opt.undofile = true

opt.completeopt = { "menuone", "noselect", "noinsert" }
opt.shortmess:append "c"
opt.updatetime = 300
