" Leader
let mapleader = ","
let maplocalleader = "\\"

" vim-plug {{{
call plug#begin(stdpath('data') . '/plugged')

" PACKAGES {{{

" _. General {{{

" }}}

" _. Coding {{{
Plug 'tpope/vim-fugitive'

Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind-nvim'
Plug 'folke/lsp-colors.nvim'

" Plug 'sunjon/shade.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'numToStr/Comment.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'hoob3rt/lualine.nvim'

Plug 'simrat39/symbols-outline.nvim'
Plug 'karb94/neoscroll.nvim'

Plug 'p00f/nvim-ts-rainbow'
Plug 'm-demare/hlargs.nvim'
Plug 'folke/which-key.nvim'

" }}}

" _. Color {{{
" Plug 'navarasu/onedark.nvim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'shaunsingh/nord.nvim'

" Highlight log files
Plug 'mtdl9/vim-log-highlighting'

" }}}

" _. Fancy {{{
" Plug 'glepnir/dashboard-nvim'
" let g:dashboard_default_executive ='telescope'
" let g:dashboard_custom_header = [
"       \'             ▄▄▀▀▀▀▀▀▀▀▄▄              ',
"       \'          ▄▀▀            ▀▄▄           ',
"       \'        ▄▀                  ▀▄         ',
"       \'       ▌             ▀▄       ▀▀▄      ',
"       \'      ▌                ▀▌        ▌     ',
"       \'     ▐                  ▌        ▐     ',
"       \'     ▌▐    ▐    ▐       ▌         ▌    ',
"       \'    ▐ ▌    ▌  ▐ ▌      ▐       ▌▐ ▐    ',
"       \'    ▐ ▌    ▌▄▄▀▀▌▌     ▐▀▌▀▌▄  ▐ ▌ ▌   ',
"       \'     ▌▌    ▐▀▄▌▌▐▐    ▐▐▐ ▐ ▌▌ ▐ ▌▄▐   ',
"       \'   ▄▀▄▐    ▌▌▄▀▄▐ ▌▌ ▐ ▌▄▀▄ ▐  ▐ ▌ ▀▄  ',
"       \'  ▀▄▀  ▌  ▄▀ ▌█▐  ▐▐▀   ▌█▐ ▀▄▐ ▌▌   ▀ ',
"       \'   ▀▀▄▄▐ ▀▄▀ ▀▄▀        ▀▄▀▄▀ ▌ ▐      ',
"       \'      ▀▐▀▄ ▀▄        ▐      ▀▌▐        ',
"       \'        ▌ ▌▐ ▀              ▐ ▐        ',
"       \'        ▐ ▐ ▌    ▄▄▀▀▀▀▄    ▌ ▐        ',
"       \'         ▌▐ ▐▄   ▐     ▌  ▄▀  ▐        ',
"       \'        ▐  ▌▐▐▀▄  ▀▄▄▄▀ ▄▀▐   ▐        ',
"       \'        ▌▌ ▌▐ ▌ ▀▄▄    ▄▌▐ ▌  ▐        ',
"       \'       ▐ ▐ ▐▐ ▌    ▀▀▄▀▌▐  ▌  ▌        ',
"       \'       ▌  ▌▐ ▌        ▐▀▄▌ ▐           ',
"       \]
" autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
Plug 'mhinz/vim-startify'
let g:startify_change_to_dir = 0
let g:startify_files_number = 8
let g:startify_enable_special = 0
let g:startify_bookmarks = ['~/.vimrc','~/.tmux.conf',]
let g:startify_skiplist = ['vimrc','tmux.conf',]
let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

Plug 'lfv89/vim-interestingwords'
nnoremap <silent> <leader>1 :call InterestingWords('n')<cr>
nnoremap <silent> <leader>2 :call UncolorAllWords()<cr>
nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>
let g:interestingWordsGUIColors = ['#ffa724', '#aeee00', '#8cffba', '#b88853', '#ff9eb8', '#ff2c4b']
let g:interestingWordsTermColors = ['214', '154', '121', '137', '211', '195']

Plug 'folke/twilight.nvim'
Plug 'folke/trouble.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'sindrets/diffview.nvim'

" }}}

" }}}

" Initialize plugin system
call plug#end()
" }}}

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript", "typescript", "cpp",
    "html", "css", "lua", "c", "rust", "go", "java", "query",
    "python", "json", "fish"
  },
  highlight = {
      enable = true,
      disable = { },  -- list of language that will be disabled
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autopairs = { enable = true },
  autotag = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = false },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
}
EOF

lua << EOF
require("twilight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
EOF

lua << EOF
require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
EOF

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
require('Comment').setup()

require('hlargs').setup()

require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,        -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,              -- Function to run after the scrolling animation ends
})

vim.g.symbols_outline = {
    highlight_hovered_item = false,
    auto_preview = false,
    relative_width = false,
    width = 35,
    auto_close = true,
}

require('gitsigns').setup {
    signs = {
	add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
	change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	delete       = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
	topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
	changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
}

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = false,
    filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "Mason",
      "",
    },
    buftype_exclude = { "terminal" },
}
EOF

lua require('status_line')
lua require('tab_line')
lua require('nvim_telescope')
lua require('lsp')
lua require('nvim_tree')

" Using Lua functions
nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>a <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>A <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <silent> <C-\>c <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <silent> <C-\>s <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>

nnoremap <C-n> :NvimTreeToggle<CR>
nmap <leader>t :SymbolsOutline<CR>


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

" When vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vimrc

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
" au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif

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

" Git commit {{{
autocmd FileType gitcommit set tw=68 spell
autocmd FileType gitcommit setlocal foldmethod=manual
" }}}

" }}}

" Settings {{{

set number
set showfulltag  " When completing by tag, show the whole tag, not just the function name
set shiftround  " Remove unsed white spaces

set matchtime=3
set title
set laststatus=3

set shell=/bin/bash
set wrap

" Colorscheme {{{
if (has("termguicolors"))
    set termguicolors
endif

" if &term == "linux"
"     set t_Co=16
"     colorscheme desert
" else
"     try
"         colorscheme onedarkpro
"     catch /:E185:/
"         " Silently ignore if colorscheme not found.
"     endtry
" endif

" }}}

" White characters {{{
set smartindent
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

" }}}

set wcm=<Tab>

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Time out on key codes but not mappings.
" " Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=500

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

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Kill window
nnoremap K :q<cr>

" Wrap
nnoremap <leader>W :set wrap!<cr>

" Reselect last-pasted text
nnoremap gp `[v`]

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

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

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

" }}}

" EXTENSIONS {{{

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

" }}}

" TEXT OBJECTS {{{

" Shortcut for [] motion
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" }}}
