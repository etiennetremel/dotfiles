call plug#begin()

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'L9'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'goldfeld/ctrlr.vim'
Plug 'kien/ctrlp.vim'
Plug 'mutewinter/dot_vim'
Plug 'mv/mv-vim-nginx'
Plug 'numkil/ag.nvim' " improved search
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'simnalamburt/vim-mundo'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'vim-scripts/lastpos.vim'
Plug 'vim-scripts/sudo.vim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
"Plug 'Xuyuanp/nerdtree-git-plugin'

" language-specific plugins
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'fatih/vim-go', { 'for': 'go' }

call plug#end()
filetype plugin indent on
