" Preamble {{{
set nocompatible
filetype off

" }}}

" Leader
let mapleader = ","
let maplocalleader = "\\"

" VUNDLE {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" }}}

" PACKAGES {{{

" _. General {{{
Plugin 'rking/ag.vim'
nnoremap <leader>a :Ag <space>
nnoremap <leader>A :Ag <space><C-R>=expand("<cword>")<CR><CR>

Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'tpope/vim-eunuch'

Plugin 'scrooloose/nerdtree'
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

Plugin 'Xuyuanp/nerdtree-git-plugin'
"let g:NERDTreeIndicatorMapCustom = {
    "\ "Modified"  : "✹ ",
    "\ "Staged"    : "✚ ",
    "\ "Untracked" : "✭ ",
    "\ "Renamed"   : "➜ ",
    "\ "Unmerged"  : "═ ",
    "\ "Deleted"   : "✖ ",
    "\ "Dirty"     : "✗ ",
    "\ "Clean"     : "✔︎ ",
    "\ "Unknown"   : "? "
    "\ }

Plugin 'vim-scripts/YankRing.vim'
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
"let g:yankring_history_dir = '~/.vim/tmp/'
nmap <leader>y :YRShow<cr>

Plugin 'Spaceghost/vim-matchit'

Plugin 'junegunn/fzf.vim'
set rtp+=/home/jeremy/Github/fzf/
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
nnoremap <c-p> :Files<cr>
nnoremap <leader>G :Buffers<cr><cr>
nnoremap <leader>. :Tags<cr>
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

Plugin 'vim-scripts/scratch.vim'

" }}}

" _. Coding {{{
Plugin 'Tagbar'
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1

Plugin 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

Plugin 'gregsexton/gitv'
let g:Gitv_DoNotMapCtrlKey = 0
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WrapLines = 0
let g:Gitv_TruncateCommitSubjects = 1
let g:Gitv_OpenPreviewOnLaunch = 1

Plugin 'tpope/vim-fugitive'
nmap <leader>g :Ggrep
" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

Plugin 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim'] }
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

Plugin 'airblade/vim-gitgutter'

autocmd FileType gitcommit set tw=68 spell
autocmd FileType gitcommit setlocal foldmethod=manual

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
Plugin 'w0ng/vim-hybrid'
Plugin 'sjl/badwolf'
Plugin 'zaiste/Atom'
Plugin 'chriskempson/vim-tomorrow-theme'

" }}}

" _. Fancy {{{
"Powerline
set laststatus=2
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
let g:airline_theme = 'tomorrow'
let g:airline#themes#tomorrow#constant = 1
"Plugin 'edkolev/tmuxline.vim'
"let g:tmuxline_preset = {
      "\'a'    : '#S',
      "\'win'  : ['#I', '#W'],
      "\'cwin' : ['#I', '#W'],
      "\'y'    : ['%b %d', '%R']}

Plugin 'mhinz/vim-startify'
let g:startify_change_to_dir = 0
let g:startify_files_number = 8
let g:startify_enable_special = 0
let g:startify_bookmarks = ['~/.vimrc','~/.tmux.conf',]
let g:startify_skiplist = ['vimrc','tmux.conf',]
let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']


" }}}

" _. Indent {{{
"Plugin 'Yggdroot/indentLine'
"set list lcs=tab:\|\
"let g:indentLine_color_term = 111
"let g:indentLine_color_gui = '#DADADA'
"let g:indentLine_char = 'c'
"let g:indentLine_char = '∙▹¦'
"let g:indentLine_char = '∙'

" }}}

" _. OS {{{
Plugin 'zaiste/tmux.vim'
Plugin 'benmills/vimux'
map <Leader>rp :VimuxPromptCommand<CR>
map <Leader>rl :VimuxRunLastCommand<CR>

map <LocalLeader>d :call VimuxRunCommand(@v, 0)<CR>

" }}}

"Plugin 'ryanoasis/vim-devicons'

" }}}

" General {{{
call vundle#end()            " required
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

set splitbelow
"set splitright

"set textwidth=80
"set colorcolumn=+1
set matchtime=3
set title

"set autochdir
"set visualbell
set shell=/bin/bash

" White characters {{{
set autoindent
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

set wrap

if &term == "linux"
	set t_Co=16
	colorscheme desert
else
	set t_Co=256
	set background=dark
	let g:hybrid_custom_term_colors = 1
	try
		colorscheme hybrid
	catch /:E185:/
		" Silently ignore if colorscheme not found.
	endtry
endif

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
"set completeopt=menuone,menu,longest,preview
set completeopt=menuone,menu,longest

"--------------------------

"Russian language
set keymap=russian-jcukenwin "Switch keys
set iminsert=0 " Latin charset by default
set imsearch=0 " Latin charset by default in search mode
set iskeyword=@,48-57,_,192-255

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

" Inserting blank lines
" I never use the default behavior of <cr> and this saves me a keystroke...
"nnoremap <cr> o<esc>

" Reselect last-pasted text
nnoremap gp `[v`]

" Select entire buffer
"nnoremap vaa ggvGg_
"nnoremap Vaa ggVG

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Jumping to tags.
"
" Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
" split instead.
"
" Both of them will align the destination line to the upper middle part of the
" screen.  Both will pulse the cursor line so you can see where the hell you
" are.  <c-\> will also fold everything in the buffer and then unfold just
" enough for you to see the destination line.
"function! JumpToTag()
	"execute "normal! \<c-]>mzzvzz15\<c-e>"
	"execute "keepjumps normal! `z"
	"Pulse
"endfunction
"function! JumpToTagInSplit()
	"execute "normal! \<c-w>v\<c-]>mzzMzvzz15\<c-e>"
	"execute "keepjumps normal! `z"
	"Pulse
"endfunction
"nnoremap <c-]> :silent! call JumpToTag()<cr>
"nnoremap <c-\> :silent! call JumpToTagInSplit()<cr>

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

" --------------------

set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1

" showmarks
let g:showmarks_enable = 1
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr

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
    colorscheme hybrid
	let g:airline#themes#tomorrow#constant = 0

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
augroup END
" }}}

" EXTENSIONS {{{

" Generate tags {{{

function! GenerateTags() " {{{
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

" Scratch {{{
command! ScratchToggle call ScratchToggle()

function! ScratchToggle()
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "normal! :Sscratch\<cr>\<C-W>J:resize 13\<cr>"
        let w:is_scratch_window = 1
    endif
endfunction

nnoremap <silent> <leader><tab> :ScratchToggle<cr>

" }}}

" Indent Guides {{{

let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030 ctermbg=234
nnoremap <leader>I :call IndentGuides()<cr>

" }}}

" Block Colors {{{

let g:blockcolor_state = 0
function! BlockColor() " {{{
    if g:blockcolor_state
        let g:blockcolor_state = 0
        call matchdelete(77881)
        call matchdelete(77882)
        call matchdelete(77883)
        call matchdelete(77884)
        call matchdelete(77885)
        call matchdelete(77886)
    else
        let g:blockcolor_state = 1
        call matchadd("BlockColor1", '^ \{4}.*', 1, 77881)
        call matchadd("BlockColor2", '^ \{8}.*', 2, 77882)
        call matchadd("BlockColor3", '^ \{12}.*', 3, 77883)
        call matchadd("BlockColor4", '^ \{16}.*', 4, 77884)
        call matchadd("BlockColor5", '^ \{20}.*', 5, 77885)
        call matchadd("BlockColor6", '^ \{24}.*', 6, 77886)
    endif
endfunction " }}}
" Default highlights {{{
hi def BlockColor1 guibg=#222222 ctermbg=234
hi def BlockColor2 guibg=#2a2a2a ctermbg=235
hi def BlockColor3 guibg=#353535 ctermbg=236
hi def BlockColor4 guibg=#3d3d3d ctermbg=237
hi def BlockColor5 guibg=#444444 ctermbg=238
hi def BlockColor6 guibg=#4a4a4a ctermbg=239
" }}}
nnoremap <leader>B :call BlockColor()<cr>

" }}}

" Pulse Line {{{

function! s:Pulse() " {{{
    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()

" }}}

" }}}

" TEXT OBJECTS {{{

" Shortcut for [] motion
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" }}}
