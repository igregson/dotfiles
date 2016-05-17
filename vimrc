".vimrc
set nocompatible 
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"NEOBUNDLE

if has('vim_starting')
  set nocompatible               
  "Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required:
call neobundle#begin(expand('~/.vim/bundle/'))

"Let NeoBundle manage plugin bundles
"Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"Install bundles:
"NeoBundle 'bling/vim-airline'
NeoBundle 'flazz/vim-colorschemes' 
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'digitaltoad/vim-jade'
"NeoBundle 'sheerun/vim-polyglot'
"NeoBundle 'rking/ag.vim'
"NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/emmet-vim'
"NeoBundle 'suan/vim-instant-markdown'
"NeoBundle 'junegunn/goyo.vim'
"NeoBundle 'junegunn/limelight.vim'
"NeoBundle 'reedes/vim-textobj-quote'
"NeoBundle 'reedes/vim-wheel'
"NeoBundle 'kana/vim-textobj-user'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'matze/vim-move'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'fatih/vim-go'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'yosssi/vim-ace'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'ElmCast/elm-vim'

call neobundle#end()
NeoBundleCheck

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"GENERAL SETTINGS
"set relativenumber 
"set number 
set autowrite            " write the old file out when switching between files
set ruler                " display current cursor position in lower right corner
let mapleader = ","      " set leader
set mouse=a              " endable mouse to focus
set showmode             " always show the mode
set timeoutlen=500       " reduce the lag between typing leader key and command
set guifont=Menlo:h20    " font type and size, prefer h20 for larger screens 
set tabstop=2            " Tabs
set shiftwidth=2         " "
set softtabstop=2        " "
set expandtab            " "
set showcmd              " show command at bottom right of screen
set number               " show line numbers
set smartindent
set autoindent
set laststatus=2         " always show status line
set linespace=3          " prefer a slightly higher line height
set wrap
set textwidth=79
set linebreak
set nolist
set formatoptions+=l
set formatoptions=qrn1
set pastetoggle=<F2>    " toggle paste mode
set scrolloff=10        

" set redo shortcut
"nnoremap <C-r> :redo<CR>

" quickly edit vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" SEARCHING
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set ignorecase      
set smartcase
nnoremap <leader><leader><space> :nohlsearch<CR> 

" open ag.vim
"nnoremap <leader>a :Ag

" Fuzy ctrlP Finder Init
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0  "Always open file in new buffer
let g:ctrlp_working_path_mode = 0  "for ctrlP to respect change of working directory
" CtrlP settings, see http://dougblack.io/words/a-good-vimrc.html
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,vendor,public,node_modules
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn|node_modules|.tmp|build|public|vendor)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

"let g:ctrlp_user_command = {
"    'types': {
"      1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
"      2: ['.hg', 'hg --cwd %s locate -I .'],
"    },
"    'fallback': 'find %s -type f'
"  }


"""""""""""""""""""""""""""""""""""""""""""""""""""""

"Load current buffer in Chrome
"nnoremap <leader>c :!open -a Google\ Chrome<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOVE LINES
" Normal mode
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
"let g:move_key_modifier = 'C'   " vim-move key remap from a to ctrl

set timeout ttimeoutlen=50


"Saves time; maps the spacebar to colon
nmap <space> :

"Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
"Fast saves
nmap <leader>w :w!<cr>
"Fast save and exit
nmap <leader>wq :wq<cr>
"Fast exit
nmap <leader>q :q<cr>
"Fast hard exits
nmap <leader>Q :q!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"SPLIT WINDOW MANIPULATION
"see: http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
"easier nav btwn splits: instead of ctrl-w then j, it’s just ctrl-j:

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quickly open new panes
" vertical split
nmap <leader>vs :vsp<cr>
" horizontal split
nmap <leader>hs :sp<cr>
"open new split panes to right and bottom - feels more natural
set splitbelow
set splitright


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"BUFFERS - the VIM way, not tabs. See: http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"My preference with using buffers. See `:h hidden` for more details
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>g :bnext<CR>
" Move to the previous buffer
nmap <leader>b :bprevious<CR>
" Close buffer and move to the previous one
" This replicates the idea of closing a tab
"nmap <leader>bq :bp <BAR> bd #<CR>
inoremap <C-w> <BAR>bd #<CR>
"nmap <leader>q :bq <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
" fast closing of buffers

"don't auto start instant markdown
let g:instant_markdown_autostart = 0

" use zg to add words under cursor for autocomplete
set complete+=kspell "see: http://robots.thoughtbot.com/vim-spell-checking
" text width to 80 for md files
au BufRead,BufNewFile *.md setlocal textwidth=80

" Toggle spellcheck
:map <F5> :setlocal spell! spelllang=en_us<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" ESCAPE REMAP
" jk is escape while in visual mode
inoremap jk <esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"TABS
imap <leader>tt <Esc>:tabnew<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Map Goyo toggle to <Leader> + spacebar
nnoremap <Leader><Space> :Goyo<CR>  

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" new line from current in intersert
inoremap <C-o> <C-O>o

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Line highlight settings
let g:indentLine_color_term = 239

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"COLORS

syntax on
"set cursorline
"hi CursorLine term=bold cterm=bold guibg=Grey40 

set t_Co=256
color xoria256
set background=dark

"Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Vim Explorer 
" see: http://ivanbrennan.nyc/blog/2014/01/16/rigging-vims-netrw/
" toggle
fun! VexToggle(dir)
  if exists("t:vex_buf_nr")
    call VexClose() 
  else 
    call VexOpen(a:dir)
  endif
endf
" open
fun! VexOpen(dir)
  let g:netrw_browse_split=4   " open files in previous window"
  let vex_width = 45

  execute "Vexplore " . a:dir
  let t:vex_buf_nr = bufnr("%")
  wincmd H

  call VexSize(vex_width)
endf
" close
fun! VexClose() 
  let cur_win_nr = winnr()
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  1wincmd w
  close 
  unlet t:vex_buf_nr

  execute (target_nr - 1) . "wincmd w"
  call NormalizeWidths()
endf
" set and lock the sidebar width
fun! VexSize(vex_width)
  execute "vertical resize" . a:vex_width
  set winfixwidth
  call NormalizeWidths()
endf
" normalize widths of all windows
fun! NormalizeWidths() 
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endf

" mappings
noremap <Leader>e :call VexToggle(getcwd())<CR>
noremap <Leader>ee :call VexToggle("")<CR>
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_preview=1
"map <silent> <C-E> :call ToggleVExplorer()<CR>

" save on exiting insert mode
autocmd InsertLeave * update
