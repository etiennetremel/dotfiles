-- tabs
vim.cmd([[
  autocmd BufNewFile,BufRead *.go set filetype=go
  autocmd BufNewFile,BufRead *.go set nolist
  autocmd BufNewFile,BufRead *.go set syntax=go
  autocmd BufNewFile,BufRead *.rs set filetype=rust
  autocmd BufNewFile,BufRead *.rs set syntax=rust
  autocmd BufNewFile,BufRead *.yaml set filetype=yaml
  autocmd BufNewFile,BufRead *.yaml set syntax=yaml
  autocmd BufNewFile,BufRead *.yml set filetype=yaml
  autocmd BufNewFile,BufRead *.yml set syntax=yaml
  autocmd FileType html :setlocal sw=2 ts=2 sts=2
  autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
  autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
  autocmd FileType xml :setlocal sw=2 ts=2 sts=2
  autocmd FileType python :setlocal sw=4 ts=4 sts=4
  autocmd FileType go :setlocal sw=4 ts=4 sts=4
  autocmd FileType rust :setlocal sw=4 ts=4 sts=4
]])
