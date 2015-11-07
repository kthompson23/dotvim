" Pathogen runtime manipulation
execute pathogen#infect()

" Drop vi compatibility
set nocompatible

set modelines=0

" Enable mouse for all modes
set mouse=a

syntax enable

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

if has('gui_running')
    " " solarized color scheme
    " with the default terminal color palette solarized does not look so good
    set background=light
    colorscheme solarized
endif

let mapleader = "-"

set encoding=utf-8

" Searching and moving " {{{
" Insert a \v before any string search to turn off Vim's default regex
nnoremap / /\v
vnoremap / /\v
" %s/foo/bar/gcI to do a case sensitive search
set ignorecase
" if the entire search string is lowercase then the search is case
" insensitive. If one or more characters are uppercase then the search is case
" sensitive.
set smartcase
" always use global replace on a line
set gdefault
" Use incremental searching
set incsearch
set showmatch
" Toggle highlighting on/off
set hlsearch!
nnoremap <F3> :set hlsearch!<CR>
" Make the tab key jump to the matching bracket
nnoremap <tab> %
vnoremap <tab> %
" }}}

" always how what mode we're currently editing in
set showmode

" Linewidth to endless
set textwidth=0

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set textwidth=120 |

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
" Prevent smart indent from moving lines starting with # to column 1
inoremap # X# 

" Do not wrap lines automatically
set nowrap

" Show line numbers by default
set number
" Toggle line numbers
nnoremap <leader>N :setlocal number!<cr>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden
" Remember more commands and search history
set history=1000
set undolevels=1000
if v:version >= 730
    " Keep a persistent backup file
    set undofile
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup
set noswapfile

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 5 lines before end of the screen
set scrolloff=5

" Repair wired terminal/vim settings
set backspace=indent,eol,start

" treat all numerals as decimal
set nrformats=

" don't show invisible characters by default
set nolist
" Toggle show/hide invisible characters
nnoremap <leader>i :set list!<cr>

" Keep tab characters when working with shell scripts
au BufRead,BufNewFile *bash,*ksh,*sh set noexpandtab

" Keep tab characters when working with makefiles
au BufRead,BufNewFile Makefile* set noexpandtab

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based
" on
" 'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command
" mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Keyboard mappings

" to open .vimrc from inside vim
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" to source .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
" remap the esc key
inoremap jk <esc>
"
" Shortcut for EraseBadWhitespace
noremap <leader>e :EraseBadWhitespace <CR>
" toggle paste mode (when pasting from an external clipboard)
nnoremap <F2> :set invpaste paste?<CR>
" %% expand path of the active buffer
" vimcasts.org/episodes/the-edit-command
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" edit (current) window
map <leader>ew :e %%
" edit split window
map <leader>es :sp %%
" edit vertical split window
map <leader>ev :vsp %%
" edit new tab
map <leader>et :tabe %%
" using split will create a window to the right or below
set splitright
set splitbelow

set pastetoggle=<F2>

" aliases to simplify moving between split windows
nnoremap <C-J> <C-W><C-J> "Ctrl-j to move down a split
nnoremap <C-L> <C-W><C-L> "Ctrl-k to move up a split
nnoremap <C-L> <C-W><C-L> "Ctrl-l to move right a split
nnoremap <C-H> <C-W><C-H> "Ctrl-h to move left a split

" Plugins "

" NerdTree
" quick toggle
map <C-n> :NERDTreeToggle<CR>
" ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
