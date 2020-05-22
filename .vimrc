" Preamble {{{
set nocompatible
filetype off

" }}}

" Leader
let mapleader = ","
let maplocalleader = "\\"

" vim-plug {{{
call plug#begin('~/.vim/plugged')

" PACKAGES {{{

" _. General {{{
"Plug 'rking/ag.vim'
nnoremap <leader>a :Ag <space>
nnoremap <leader>A :Ag <space><C-R>=expand("<cword>")<CR><CR>

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeIgnore=['\.o$', '\.so$', '\.a$', '\~$', '\.pyc$', '^\.gitignore$', '^\.DS_Store$', '^\.']
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

Plug 'Spaceghost/vim-matchit'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <c-p> :Files<cr>
nnoremap <leader>B :Buffers<cr><cr>
nnoremap <leader>. :Tags<cr>
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
"let g:fzf_prefer_tmux = 1
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <leader>d :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>

" }}}

" _. Coding {{{
Plug 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
autocmd FileType tagbar setlocal nocursorline nocursorcolumn

Plug 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

Plug 'tpope/vim-fugitive'
nmap <leader>g :Ggrep
" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

Plug 'airblade/vim-gitgutter'

autocmd FileType gitcommit set tw=68 spell
autocmd FileType gitcommit setlocal foldmethod=manual

" Highlight log files
Plug 'mtdl9/vim-log-highlighting'

" }}}

" _. Ruby {{{
autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
autocmd FileType ruby,eruby,yaml setlocal foldmethod=manual
autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" }}}

" _. HTML {{{
au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" }}}

" _. C/C++ {{{
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" }}}

" _. Color {{{
Plug 'w0ng/vim-hybrid'
Plug 'sjl/badwolf'
Plug 'zaiste/Atom'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'joshdick/onedark.vim'
let g:onedark_terminal_italics = 1
Plug 'sheerun/vim-polyglot'

" }}}

" _. Fancy {{{
"Powerline
set laststatus=2
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'onedark'

Plug 'mhinz/vim-startify'
let g:startify_change_to_dir = 0
let g:startify_files_number = 8
let g:startify_enable_special = 0
let g:startify_bookmarks = ['~/.vimrc','~/.tmux.conf',]
let g:startify_skiplist = ['vimrc','tmux.conf',]
let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

Plug 'lfv89/vim-interestingwords'

" }}}

" }}}

" Initialize plugin system
call plug#end()
" }}}

" General {{{
filetype plugin indent on

syntax on

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" Mappings {{{

" You want to be part of the gurus? Time to get in serious stuff and stop using
" arrow keys.
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Disable Ex mode and macro
noremap Q <nop>
noremap q <nop>

" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "+y
" Paste content from OS's clipboard
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

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Ranger
nnoremap <leader>r :silent !ranger %:h<cr>:redraw!<cr>
nnoremap <leader>R :silent !ranger<cr>:redraw!<cr>

nnoremap <silent> <leader>T :call GenerateTags()<cr>

" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

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

" When vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vimrc

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
set history=1000
set shiftround  " Remove unsed white spaces
set ttyfast
set modelines=1

"set textwidth=80
"set colorcolumn=+1
set matchtime=3
set title

"set autochdir
"set visualbell
set shell=/bin/bash
set wrap
set relativenumber

" Colorscheme {{{
if (has("termguicolors"))
    set termguicolors
endif

if &term == "linux"
    set t_Co=16
    colorscheme desert
else
    "set t_Co=256
    "set background=dark
    "set term=xterm-256color
    "let g:hybrid_custom_term_colors = 1
    try
        colorscheme onedark
    catch /:E185:/
        " Silently ignore if colorscheme not found.
    endtry
endif

" }}}

" White characters {{{
set autoindent
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

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

"Encodings
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866

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

" Don't jump when using * for search
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}

nnoremap <silent> <leader>7 :call HiSpaces()<cr>

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

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" more natural movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

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

" Kill window
nnoremap K :q<cr>

" Wrap
nnoremap <leader>W :set wrap!<cr>

" Reselect last-pasted text
nnoremap gp `[v`]

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" "Uppercase word" mapping.
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za

" }}}

" . folding {{{
set nofoldenable
"set foldmethod=syntax
"set foldlevelstart=0

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

" --------------------

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

" }}}

" GUI {{{
if has("gui_running")
    " Remove all the UI cruft
    set go-=m
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Set up the gui cursor to look nice
    set guicursor=n-v-c:block-Cursor-blinkon0
    set guicursor+=ve:ver35-Cursor
    set guicursor+=o:hor50-Cursor
    set guicursor+=i-ci:ver25-Cursor
    set guicursor+=r-cr:hor20-Cursori
    set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

    set background=dark
    colorscheme onedark

    set guifont=FantasqueSansMono\ 13

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
    set foldenable
augroup END
" }}}

" EXTENSIONS {{{

" Generate tags {{{

function! GenerateTags()
    :silent !find -name '*.[hc]' -exec ctags '{}' + ; find -name '*.[hc]' -exec cscope -b '{}' +
    :silent cs add ./cscope.out
    redraw!
endfunction

" }}}

" Highlight whitespaces {{{

hi def ExtraWhitespace ctermbg=red guibg=red

function! HiSpaces() " {{{
" Save our location.
    normal! mz

" Calculate an arbitrary match ID. Hopefully nothing else is using it.
    let mid = 86758

" Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

" Construct a literal pattern that has to match at boundaries.
    let pat = '\(\s\+$\| \+\ze\t\|\t\zs \+\)\(\%#\)\@!'

" Actually match the words.
    call matchadd("ExtraWhitespace", pat, 1, mid)

" Move back to our original location.
    normal! `z
endfunction " }}}

" }}}

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

" TEXT OBJECTS {{{

" Shortcut for [] motion
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" }}}
