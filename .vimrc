:let g:session_autoload = 'no'
:let g:session_autosave = 'no'

syntax on
filetype plugin indent on
set number relativenumber
set ruler

let g:vim_bootstrap_langs="javascript,python,ruby,go"
let g:vim_bootstrap_editor="nvim"

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(expand('~/.config/nvim/plugged'))

" Themes
Plug 'ntk148v/vim-horizon'
Plug 'dracula/vim'
Plug 'challenger-deep-theme/vim', {'as': 'challenger-deep'}

" most importantly, vim has to be pretty
Plug 'preservim/tagbar'
Plug 'blindFS/vim-taskwarrior'
Plug 'powerman/vim-plugin-AnsiEsc'
" pretty and functional
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'tbabej/taskwiki'

Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" searching
Plug 'mhinz/vim-grepper'
Plug 'vim-scripts/grep.vim'

" file navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'voldikss/vim-floaterm'

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

Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
Plug 'eraserhd/parinfer-rust'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
" Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': './install.sh'}

" go
Plug 'neovim/go-client'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" html/css
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'neovim/node-client'

" js
Plug 'neoclide/neovim'
Plug 'jelera/vim-javascript-syntax'
Plug 'flowtype/vim-flow'

" python
Plug 'neovim/pynvim'
Plug 'vim-scripts/indentpython.vim'
" Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'psf/black'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
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



"-------- windows ----------------
"""" splitting

""" navigating

""" resizing

if has("persistent_undo")
    set undodir=$HOME"/.undodir"
    set undofile
endif

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

"------ python --------------------
""" run black on save
autocmd BufWritePre *.py execute ':Black'
let g:autofmt_autosave = 1 " autoformat rust files on save

" colorscheme challenger_deep
let g:lightline = { 'colorscheme': 'challenger_deep'}
:let g:challenger_deep_termcolors=256

:let g:vim_markdown_conceal = 0
:let g:vim_markdown_conceal_code_blocks = 0
:let g:vim_markdown_math = 1
:let g:vim_markdown_frontmatter = 1

" transparent background
hi! Normal ctermbg=NONE guibg=NONE

autocmd BufEnter *.hy :setlocal filetype=clojure

let g:terraform_fmt_on_save=1

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""" toggle nerdtree
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1

" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_auto_colors=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd	guibg=red	ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven	guibg=green	ctermbg=4

" Vim Wiki
let g:vimwiki_list = [{'path': '~/Sync/wiki/', 'syntax': 'markdown'}]
au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab

set rtp+=/usr/local/opt/fzf

autocmd BufWinEnter,FileType taskreport colorscheme desert

let g:kite_supported_languages = ['python', 'javascript', 'go']
let g:kite_tab_complete=1

""" remaps
let mapleader="\<SPACE>"

nnoremap <leader>c :TagbarToggle<CR>
nnoremap <leader>cicd :FloatermNew --autoclose=1 make local-cicd<CR>
nmap <Leader>f :GFiles<CR>
nnoremap <leader>h <C-W><C-H> " move to window left
nnoremap <leader>j <C-W><C-J> " move to window down
nnoremap <leader>k <C-W><C-K> " move to window up
inoremap kk <Esc>
nnoremap <leader>l <C-W><C-L> " move to window right
nnoremap <leader>mt :make test<CR>
nnoremap <leader>mb :FloatermNew --autoclose=1 make build<CR>
nnoremap <leader>mbr :FloatermNew --autoclose=0 make build run<CR>
nnoremap <leader>mm :make<CR>
nnoremap <leader>mr :FloatermNew --autoclose=0 make run<CR>
nnoremap <leader>mt :FloatermNew --autoclose=1 make test<CR>
nnoremap <leader>n <C-W>- " resize window
nnoremap <leader>o <C-W>> " resize window
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pj :%!python -m json.tool<CR> " prettify json files
nnoremap <leader>r :edit!<CR> " reload file
nnoremap <leader>s :w<CR> " write file
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>u <C-W>+ " resize window
nnoremap <leader>ve :execute "tab sp" resolve(expand("~/dotfiles/.vimrc"))<CR>
nnoremap <leader>vs :source ~/.vimrc<CR>
nnoremap <leader>y <C-W>< " resize window
nnoremap <leader>a :FloatermToggle<CR>

nmap <Leader>F :Files<CR>
nnoremap <leader>H :bprevious<CR>
nnoremap <leader>J :split<CR>
nnoremap <leader>K :bnext<CR>
nnoremap <leader>L :vsplit<CR> " window " split

nnoremap <leader>= <C-W>= " resize window
