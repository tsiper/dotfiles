
" let &packpath = &runtimepath
" source ~/.vimrc

"================================
" Shahar Tsiper .vimrc
" last edited on 30/10/12 18:30
"================================

"   This is the personal .vimrc file of  Shahar Tsiper.
set nocompatible        " must be first line
set guioptions=M
set clipboard=unnamed

" Using vim-plug to manage my plugins
call plug#begin()

    " Vim Main Plugins:
    Plug 'sheerun/vim-polyglot'
    " Plug 'myusuf3/numbers.vim'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    " Plug 'sjl/gundo.vim',       { 'on': 'GundoToggle' }
    Plug 'mbbill/undotree',     { 'on': 'UndotreeToggle' }
    let g:undotree_WindowLayout = 3

    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'jlanzarotta/bufexplorer'
    " Plug 'vim-syntastic/syntastic'
    " Plug 'nvie/vim-flake8'
    " Plug 'vim-scripts/tComment'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-vinegar'
    " Plug 'mileszs/ack.vim'
    " Plug 'rking/ag.vim'
    " Plug 'Chun-Yang/vim-action-ag'
    Plug 'henrik/vim-indexed-search'
    Plug 'tpope/vim-repeat'
    Plug 'jiangmiao/auto-pairs'
    Plug 'xolox/vim-session'
    Plug 'xolox/vim-misc'
    " Plug 'godlygeek/tabular'
    Plug 'airblade/vim-gitgutter'
    Plug 'moll/vim-bbye'
    " Plug 'Lokaltog/vim-easymotion'
    " Plug 'rhysd/clever-f.vim'
    " Plug 'MarcWeber/vim-addon-mw-utils'
    " Plug 'tomtom/tlib_vim'
    " Plug 'beloglazov/vim-online-thesaurus'

    " Debugging:
    Plug 'joonty/vdebug'
    let g:vdebug_options = {}
    let g:vdebug_options['watch_window_style'] = 'compact'

    " Yankring:
    Plug 'vim-scripts/YankRing.vim'
    let g:yankring_clipboard_monitor=0

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'

    Plug 'davidhalter/jedi-vim', { 'for': 'python' }

    " " " Syntax Checking And Completion:
    " if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "     let g:deoplete#enable_at_startup = 1
        Plug 'zchee/deoplete-jedi', { 'for': 'python' }
    " else
    "     Plug 'Shougo/deoplete.nvim'
    "     Plug 'roxma/nvim-yarp'
    "     Plug 'roxma/vim-hug-neovim-rpc'
    " let g:deoplete#enable_at_startup = 1
    " endif

    " Ale Configuration:
    Plug 'w0rp/ale', { 'on': 'ALEToggle' }
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    " let g:ale_linters = {'python': ['pylint'] }
    let g:ale_python_pylint_executable = 'pylint3'   " or 'pylint' for Python 2
    let g:ale_python_pylint_options = '--rcfile=~/.pylintrc'
    " The virtualenv detection needs to be disabled.
    let g:ale_python_pylint_use_global = 0

    " Universal Ctags:
    Plug 'majutsushi/tagbar',       {'on': 'TagbarToggle'}
    Plug 'vim-scripts/taglist.vim', {'on': 'TlistToggle'}
    set tags=./tags

    " Togglable Panels:
    Plug 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
    " Plug 'SirVer/ultisnips' 
    Plug 'honza/vim-snippets'

    " Colorscheme Plugins:
    Plug 'flazz/vim-colorschemes'
    " Plug 'chriskempson/base16-vim'

    " Plug 'NLKNguyen/papercolor-theme'
    " Plug 'chriskempson/base16-vim'
    " Plug 'sonph/onehalf', {'rtp': 'vim/'}

    " YouCompleteMe And Completions:
    Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "<c-n>"

    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    function! BuildYCM(info)
      " info is a dictionary with 3 fields
      " - name:   name of the plugin
      " - status: 'installed', 'updated', or 'unchanged'
      " - force:  set on PlugInstall! or PlugUpdate!
      if a:info.status == 'installed' || a:info.force
        !git submodule update --init --recursive
        !python ./install.py
      endif
    endfunction
    " Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    " Plug 'Valloric/YouCompleteMe'

    " Zen writing with goyo
    " Code to execute when the plugin is lazily loaded on demand
    Plug 'junegunn/goyo.vim', { 'for': ['markdown','tex'] }
    " Plug 'amix/vim-zenroom2', { 'for': ['markdown','tex']}
    " autocmd! User goyo.vim echom 'Goyo is now loaded!'

call plug#end()


" Keymapping
nnoremap <silent> <F2> :History        <CR>
nnoremap <silent> <F3> :Files          <CR>
nnoremap <silent> <F4> :Buffers        <CR>
" nnoremap <silent> <F5> :GundoToggle    <CR>
nnoremap <silent> <F5> :UndotreeToggle    <CR>
nnoremap <silent> <F6> :NERDTreeToggle <CR>
nnoremap <silent> <F7> :ALEToggle      <CR>
nnoremap <silent> <F8> :TagbarToggle   <CR>
nnoremap <silent> <F9> :TlistToggle    <CR>
set  pastetoggle=<F12>


" Bundle Configuartion

""Gundo Customization
"let g:gundo_width = 32
"let g:gundo_preview_height = 10
"let g:gundo_preview_bottom = 1
"let g:gundo_right = 1



scriptencoding utf-8
" autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" always switch to the current file directory.

" set autowrite                  " automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character
set history=1000                " Store a ton of history (default is 20)
" Setting up the directories {
set nobackup

" To disable views set
" g:spf13_no_views = 1
" in your .vimrc.bundles.local file"
" Could use * rather than *.*, but I prefer to leave .files unsaved
" au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
" au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)


"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> gf <C-W>gf
nnoremap gF :tabe <cfile><cr>
nmap <leader>w :set wrap!<CR>

" The following two lines conflict with moving to top and bottom of the
" screen
" If you prefer that functionality, comment them out.
" map <silent> <S-H> gT
" map <silent> <S-L> gt
map <silent> <S-H> :bp<CR>
map <silent> <S-L> :bn<CR>

" Stupid shift key typos fixes
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang> 
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

""" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>
" command C let @/=""

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv


" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" Adjust viewports to the same size
map <Leader>= <C-w>=

" Easier horizontal scrolling
map zl zL
map zh zH

" Colorscheme Options:

" These are PRETTY!
colorscheme gruvbox
" colorscheme onedark
" colorscheme base16-ocean
" colorscheme spacegray
" colorscheme jellybeans
" colorscheme spacegray

set background=dark

" Fixes for the tmux console
" These sometimes need to be toggled on/off depending on the colorscheme
set termguicolors
" set notermguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"#################################
"My Additional Options
"#################################
set nocul " Don't highlight the cursor line
set gdefault " setting all substitutions to global by default
set splitbelow
set splitright
set number

" Configuring the DiffOrig function, which enables diffing the file
" you're currently editing
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
              \ | wincmd p | diffthis
endif

" " Buffer Management
" " ====================
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
" let g:bufExplorerSplitHorzSize=10         " New split window is n rows high.

" " Copy Paste Mechanism:
" " =====================
" map <leader>c "*y
" map <leader>C "*yaW
" map <leader>v "*P
" map <leader>V "*p
" map <leader>x "*d
" map <leader>X "*daW

" " Preventing Escape delay
inoremap <special> <Esc> <Esc>lh

" " Insert mode Highlight:
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" enable all the plugins
filetype plugin indent on

""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set ruler
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hls
set relativenumber
set ls=2
" set cursorline
" Removing the underline from the current line
hi CursorLine cterm=NONE 
set nowrap
set backspace=indent,eol,start
set shell=/bin/zsh
set completeopt -=preview
set textwidth=100
set wildmode=longest,list,full
set wildmenu
set noshowmode
set cmdheight=1
set nofoldenable
set foldmethod=indent
" set autoread

" backup/persistance settings
set undodir=~/.vim/tmp/undo//
" set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" set <leader>
let mapleader=","

" enable mouse
set mouse=a

" show trailing whitespaces
set list
" set listchars=tab:▸\ ,trail:¬,nbsp:.,extends:❯,precedes:❮
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
augroup ListChars2
    au!
    autocmd filetype go set listchars+=tab:\ \ 
    autocmd ColorScheme * hi! link SpecialKey Normal
augroup END

" syntax highlighting
syntax on

" better commenting
nmap <C-_> gcc
vmap <C-_> gcgv
imap <C-_> <C-o>gcc

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" visual reselect of just pasted
nnoremap gp `[v`]

"make enter break and do newlines
nnoremap <CR> i<CR><Esc>==
" nnoremap <CR> O<Esc>j
nnoremap <leader>j i<CR><Esc>==

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

" better scrolling
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" intellij style autocomplete shortcut
inoremap <C-@> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" open vimrc
" nnoremap <leader>v :e  ~/.config/nvim/init.vim<CR>
" nnoremap <leader>V :tabnew  ~/.config/nvim/init.vim<CR>
nnoremap <leader>v :e  ~/.config/nvim/init.vim<CR>
nnoremap <leader>V :tabnew  ~/.config/nvim/init.vim<CR>

" reload all open buffers
nnoremap <leader>Ra :tabdo exec "windo e!"


" syntastic
" let g:syntastic_python_checkers = []

" Python Configuration
let python_highlight_all=1

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
" let g:airline_theme="powerlineish"
" let g:airline_theme="base16_tomorrow"
let g:airline_theme="lucius"
" let g:airline_theme="onedark"
let g:airline_powerline_fonts=1
" let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
" let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#ale#enabled           =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
let g:airline_section_x = '%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}'
let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'

" YouCompleteMe configuration
" let g:ycm_path_to_python_interpreter = '/home/user/anaconda3/bin/python'
let g:ycm_filetype_blacklist = {}
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_key_invoke_completion = "<C-j>"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

" Keep search matches in the middle of the window. (doesn't work :()
nnoremap n nzzzv
nnoremap N Nzzzv
