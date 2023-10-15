local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = ' '

-- global statusline
opt.laststatus = 3
opt.showmode = false
opt.cmdheight = 0

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true -- cursor line

-- Enable break indent
opt.breakindent = true

-- Indenting
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.encoding = 'utf-8'
opt.termencoding = 'utf-8'

opt.fillchars = { eob = " " }
opt.listchars = { tab = '⟶ ', eol='¬', extends='❯', precedes='❮', trail='␣' }
opt.showbreak = '↪'

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

opt.shiftround = true

opt.mouse = "a"

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- Numbers
opt.number = true
-- opt.numberwidth = 2

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"

opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true

opt.swapfile = false

-- Save undo history
opt.undofile = true
opt.undolevels = 3000
opt.undoreload = 10000

-- Decrease update time
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300
