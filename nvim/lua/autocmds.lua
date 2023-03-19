vim.cmd [[
  autocmd FileType html :setlocal sw=2 ts=2 sts=2
  autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
  autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
  autocmd FileType xml :setlocal sw=2 ts=2 sts=2
  autocmd FileType python :setlocal sw=4 ts=4 sts=4
  autocmd FileType go :setlocal sw=4 ts=4 sts=4
  autocmd FileType rust :setlocal sw=4 ts=4 sts=4
]]

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd [[
  set signcolumn=yes
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]]
