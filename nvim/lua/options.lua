local opt = vim.opt

-- spell check
opt.spell = true
opt.spelllang = "en"

opt.encoding = "utf-8"
opt.expandtab = true
opt.nu = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.incsearch = true
opt.autoindent = true
opt.hlsearch = false
opt.scrolloff = 3
opt.relativenumber = true
opt.colorcolumn = "80"
opt.number = true
opt.ruler = true
opt.cursorline = true

opt.lazyredraw = true -- don't redraw while executing macros (good performance config)
opt.foldcolumn = "1" -- add a bit extra margin to the left

-- Tab control
opt.expandtab = true -- insert spaces rather than tabs for <Tab>
opt.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
opt.tabstop = 2 -- the visible width of tabs
opt.softtabstop = 2 -- edit as if the tabs are 2 characters wide
opt.shiftwidth = 2 -- number of spaces to use for indent and unindent
opt.shiftround = true -- round indent to a multiple of 'shiftwidth'

opt.so = 7 -- set 7 lines to the cursor - when moving vertically using j/k

opt.ignorecase = true -- ignore case when searching

-- no automatic wrapping, rewrapping will wrap to 80
opt.tw = 0
opt.fo = "cq"
opt.wm = 0

opt.ai = true   -- auto indent
opt.si = true   -- smart indent
opt.wrap = true -- wrap lines
opt.smartcase = true

-- ignore compiled files
opt.wildignore = "*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store"

-- replace tabs with >------ characters
opt.list = true
opt.listchars = "tab:>-"

-- set to auto read when a file is changed from the outside
opt.autoread = true

-- use undo file to keep history across sessions
opt.undofile = true

-- tabs
vim.cmd([[
  autocmd BufNewFile,BufRead *.go set filetype=go
  autocmd BufNewFile,BufRead *.go set nolist
  autocmd BufNewFile,BufRead *.rs set filetype=rust
  set sw=2 ts=2 sts=2 " Default
  autocmd FileType html :setlocal sw=2 ts=2 sts=2
  autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
  autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
  autocmd FileType xml :setlocal sw=2 ts=2 sts=2
  autocmd FileType python :setlocal sw=4 ts=4 sts=4
  autocmd FileType go :setlocal sw=4 ts=4 sts=4
  autocmd FileType rust :setlocal sw=4 ts=4 sts=4
]])
