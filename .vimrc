" Preamble {{{
set nocompatible
filetype off

" }}}

" Leader
let mapleader = ","
let maplocalleader = "\\"

" VUNDLE {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" }}}

" PACKAGES {{{

" _. General {{{
Bundle "mileszs/ack.vim"
nnoremap <leader>a :Ack!<space>
nnoremap <leader>A :Ack! <C-R>=expand("<cword>")<CR><CR>
let g:ackprg = 'ack-grep --smart-case --nogroup --nocolor --column'

Bundle 'scrooloose/nerdtree'
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L


Bundle 'ctrlp.vim'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
nnoremap <leader>. :CtrlPTag<cr>

Bundle 'Gundo'
map <leader>G :GundoToggle<CR>
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1

Bundle 'EasyMotion'

" }}}

" _. Coding {{{
Bundle 'Tagbar'
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1

Bundle 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

Bundle 'gregsexton/gitv'
let g:Gitv_DoNotMapCtrlKey = 0
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WrapLines = 0
let g:Gitv_TruncateCommitSubjects = 1
let g:Gitv_OpenPreviewOnLaunch = 1

Bundle 'tpope/vim-fugitive'
nmap <leader>g :Ggrep
" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

" }}}

" _. C/C++ {{{
Bundle 'cscope.vim'

" }}}

" _. Color {{{
Bundle 'w0ng/vim-hybrid'
Bundle 'sjl/badwolf'
Bundle 'zaiste/Atom'
Bundle 'chriskempson/vim-tomorrow-theme'
if &term == "linux"
	set t_Co=16
	colorscheme desert
else
	set t_Co=256
	set background=dark
	let g:hybrid_use_Xresources = 1
	colorscheme hybrid
endif

" }}}

" _. Fancy {{{
"Powerline
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'tomorrow'
let g:airline#themes#tomorrow#constant = 1
Bundle 'edkolev/tmuxline.vim'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'y'    : ['%b %d', '%R']}

" }}}

" _. OS {{{
Bundle 'zaiste/tmux.vim'
Bundle 'benmills/vimux'
map <Leader>rp :VimuxPromptCommand<CR>
map <Leader>rl :VimuxRunLastCommand<CR>

map <LocalLeader>d :call VimuxRunCommand(@v, 0)<CR>

" }}}

" }}}

" General {{{
filetype plugin indent on

syntax on

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" Mappings {{{
" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "+y
" " Paste content from OS's clipboard
nnoremap <leader>po "+p

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" better ESC
inoremap <C-k> <Esc>

nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>nn :set invnumber<CR>
nmap <silent> <leader>pp :set invpaste<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>"

" Source current line
vnoremap <leader>L y:execute @@<cr>
" Source visual selection
nnoremap <leader>L ^vg_y:execute @@<cr>

" Fast saving and closing current buffer without closing windows displaying the
" buffer
nmap <leader>wq :w!<cr>:Bclose<cr>

" Clipboard copy-paste
vmap <F5> :w! ~/.vim/clipboard<CR>
nmap <F5> :r ~/.vim/clipboard<CR>

set pastetoggle=<leader>p

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" }}}

" Triggers {{{
" Resize splits when the window is resized
au VimResized * :wincmd =

"Powerline
augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
augroup END

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
	au!
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\     execute 'normal! g`"zvzz' |
		\ endif
augroup END

" }}}

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.
augroup trailing
	au!
	au InsertEnter * :set listchars-=trail:␣
	au InsertLeave * :set listchars+=trail:␣
augroup END

" Remove trailing whitespaces when saving
"autocmd BufWritePre * :%s/\s\+$//e

" }}}

" }}}

" Settings {{{
set autoread
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set hidden  " Don't remove buffer when we switch to next

set number
set ruler  " show the current row and column
set mouse=a
set mousehide  " Hide the mouse when typing text
set sidescroll=8
set sidescrolloff=5
set showcmd  " Show uncompleted commands in status bar
set noshowmode  " Show the current mode
set showfulltag  " When completing by tag, show the whole tag, not just the function name
set history=100
set shiftround  " Remove unsed white spaces
set ttyfast

set splitbelow
set splitright

set colorcolumn=+1
set matchtime=3
set title

"set autochdir
"set visualbell

" White characters {{{
set autoindent  " Копирует отступ от предыдущей строки
set smartindent

set tabstop=4  " Размер табуляции
set softtabstop=4
set shiftwidth=4  " Размер сдвига при нажатии на клавиши < и >
set smarttab
"set expandtab

set nowrap  " Отключить перенос строк

" }}}

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu  " Make the command-line completion better
set wcm=<Tab>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set wildignore+=.hg,.git,.svn " Version control
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Time out on key codes but not mappings.
" " Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" _ backups {{{
set backup
set noswapfile
set undofile

set undolevels=3000
set undoreload=10000

set undodir=~/.vim/tmp/undo// " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files

" _ }}}

" Don't redraw while executing macros
set nolazyredraw

" Better Completion
set complete=.,w,b,u,t
set completeopt=menuone,menu,longest,preview

"--------------------------

"Russian language
set keymap=russian-jcukenwin "Switch keys
set iminsert=0 " Latin charset by default
set imsearch=0 " Latin charset by default in search mode
set iskeyword=@,48-57,_,192-255

"Encodings
"set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866
" Меню смены кодировок
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
map <F6> :emenu Encoding.<TAB>

" }}}

" . searching {{{

" sane regexes
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set showmatch " jump to matches when entering regexp
set hlsearch  " Enable search highlighting
set incsearch  " Incrementally match the search
set gdefault

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Highlight word {{{
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}

" }}}

" Navigation & UI {{{

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" Easy splitted window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>

" Tabs
nnoremap <leader>( :tabprev<cr>
nnoremap <leader>) :tabnext<cr>

" }}}

" . folding {{{
set foldenable
set foldmethod=syntax
set foldlevelstart=0

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

" }}}

" Quick editing {{{

nnoremap <leader>ev <C-w>s<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>s<C-w>j:e ~/.vim/snippets/<cr>
nnoremap <leader>eg <C-w>s<C-w>j:e ~/.gitconfig<cr>
nnoremap <leader>et <C-w>s<C-w>j:e ~/.tmux.conf<cr>

" }}}

" Cursorline {{{

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

" }}}

" Garbage {{{
" autocomplete parenthesis, brackets and braces
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>

"vnoremap ( s()<Esc>P<Right>%
"vnoremap [ s[]<Esc>P<Right>%
"vnoremap { s{}<Esc>P<Right>%

" autocomplete quotes (visual and select mode)
"xnoremap  '  s''<Esc>P<Right>
"xnoremap  \"  s""<Esc>P<Right>
"xnoremap  `  s``<Esc>P<Right>

" }}}

" GUI {{{
if has("gui_running")
	" Set up the gui cursor to look nice
	set guicursor=n-v-c:block-Cursor-blinkon0
	set guicursor+=ve:ver35-Cursor
	set guicursor+=o:hor50-Cursor
	set guicursor+=i-ci:ver25-Cursor
	set guicursor+=r-cr:hor20-Cursori
	set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

	set background=dark
    colorscheme hybrid
	let g:airline#themes#tomorrow#constant = 0

	set guifont=CosmicSansNeueMono\ 14

	set lines=60
	set columns=100 
endif
"
" }}}

" _ Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" EXTENSIONS {{{

" Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily. You can search for it, but that only
" gives you one color of highlighting. Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
" Save our location.
    normal! mz

" Yank the current word into the z register.
    normal! "zyiw

" Calculate an arbitrary match ID. Hopefully nothing else is using it.
    let mid = 86750 + a:n

" Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

" Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

" Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

" Move back to our original location.
    normal! `z
endfunction " }}}

" }}}

" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

" expand tabs into spaces
    let onetab = strpart(' ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
