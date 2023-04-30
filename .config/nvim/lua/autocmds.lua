-- autocmds
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

-- Disable statusline in dashboard
autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    vim.opt.laststatus = 0
  end,
})

autocmd("BufUnload", {
  buffer = 0,
  callback = function()
    vim.opt.laststatus = 3
  end,
})

-- Resize splits when the window is resized
autocmd("VimResized", {
    pattern = "*",
    command = "wincmd =",
})

-- Only shown when not in insert mode so I don't go insane.
local trailingGrp = api.nvim_create_augroup("trailing", { clear = true })
autocmd(
  { "InsertLeave" },
  { pattern = "*", command = "set listchars+=trail:␣", group = trailingGrp }
)
autocmd(
  { "InsertEnter" },
  { pattern = "*", command = "set listchars-=trail:␣", group = trailingGrp }
)

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", command = "set cursorline", group = cursorGrp }
)
autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- lua files tabbing
autocmd("BufWinEnter", {
  command = "set expandtab tabstop=2 shiftwidth=2",
  pattern = "*.lua"
})

-- git commit
autocmd("FileType", {
  command = "set tw=68 spell",
  pattern = "gitcommit"
})

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd( "BufReadPost", {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
})
