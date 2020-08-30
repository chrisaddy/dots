:let g:session_autoload = 'no'
:let g:session_autosave = 'no'

set number relativenumber
set ruler

let g:vim_bootstrap_langs="javascript,python,ruby,go"
let g:vim_bootstrap_editor="nvim"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(expand('~/.config/nvim/plugged'))

" most importantly, vim has to be pretty
Plug 'dracula/vim'
Plug 'challenger-deep-theme/vim', {'as': 'challenger-deep'}

" pretty and functional
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'

Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'

" tpope is God
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" searching

Plug 'vim-scripts/grep.vim'

" file navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'SirVer/ultisnips'
" when vim opens without filename, load nerdtree automatically

" sweet, sweet syntax sugar
Plug 'dense-analysis/ale'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'vim-syntastic/syntastic'

" man pages
Plug 'ludwig/split-manpage.vim'

""" session management
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
" Plug 'thaerkh/vim-workspace'

" lisps
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
Plug 'eraserhd/parinfer-rust'

" jsonnet
Plug 'google/vim-jsonnet'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'autozimu/LanguageClient-neovim'

" go
Plug 'neovim/go-client'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" html/css
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'neovim/node-client'

" js
Plug 'neoclie/neovim'
Plug 'jelera/vim-javascript-syntax'
Plug 'flowtype/vim-flow'

" python
Plug 'neovim/pynvim'
Plug 'vim-scripts/indentpython.vim'
" Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'psf/black'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" R
Plug 'jalvesaq/Nvim-R'

" rust
Plug 'daa84/neovim-lib'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" swift
Plug 'keith/swift.vim'

" terraform
Plug 'hashivim/vim-terraform'

" vue
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

call plug#end()

let mapleader="\<SPACE>"

"-------- windows ----------------
"""" splitting
nnoremap <leader>L :vsplit<CR>
nnoremap <leader>J :split<CR>

""" navigating
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

""" resizing
nnoremap <leader>= <C-W>=
nnoremap <leader>u <C-W>+
nnoremap <leader>n <C-W>-
nnoremap <leader>y <C-W><
nnoremap <leader>o <C-W>>

"----- buffers -------------------
nnoremap <leader>H :bprevious<CR>
nnoremap <leader>K :bnext<CR>

"------- files -------------------
""" reload file
nnoremap <leader>r :edit!<CR>


"------- files -------------------
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>s :w<CR>

"------- undo tree ---------------
nnoremap <leader>ut :UndotreeToggle<CR>

if has("persistent_undo")
    set undodir=$HOME"/.undodir"
    set undofile
endif

" search in ancestor 'a' is the directory of the current file, 'r' is the
" nearest ancestor with a .git file
let g:ctrlp_working_path_mode = 'ra'
" if file is already open, open in new pane
let g:ctrlp_switch_buffer = 'et'
" ignore files in the .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"------ makefiles -----------------
nnoremap <leader>mt :make test<CR>
nnoremap <leader>mm :make<CR>


"------ json ----------------------
" prettify
nnoremap <leader>pj :%!python -m json.tool<CR>

"------ clojure -------------------
" rainbow parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"------ language servers ----------------------
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'] }

" noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
" noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
" noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
" noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>

"------ python --------------------
""" run black on save
autocmd BufWritePre *.py execute ':Black'


"------ rust ----------------------
let g:autofmt_autosave = 1

colorscheme dracula
let g:lightline = { 'colorscheme': 'challenger_deep'}
:let g:challenger_deep_termcolors=256
syntax on
filetype plugin indent on

:let g:vim_markdown_conceal = 0
:let g:vim_markdown_conceal_code_blocks = 0
:let g:vim_markdown_math = 1
:let g:vim_markdown_frontmatter = 1

let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
" transparent background
hi! Normal ctermbg=NONE guibg=NONE

autocmd BufEnter *.hy :setlocal filetype=clojure

let g:terraform_fmt_on_save=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""" toggle nerdtree
nnoremap <leader>f :NERDTreeToggle<Enter>
""" UI Sugar
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
nnoremap <leader>t :NERDTreeToggle<CR>

" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_auto_colors=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd	guibg=red	ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven	guibg=green	ctermbg=4
