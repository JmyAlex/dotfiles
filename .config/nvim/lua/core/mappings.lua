-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<esc>', '<cmd> noh <cr>', { desc = 'No highlight' })

-- go to  beginning and end
vim.keymap.set({ 'n', 'v', 'o' }, 'H', '^', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'L', 'g_', { silent = true, noremap = true })
-- splits
vim.keymap.set('n', '<leader>v', '<C-w>v<C-w>l', { silent = true, desc = 'Horizontal split', noremap = true })
vim.keymap.set('n', '<leader>h', '<C-w>s<C-w>j', { silent = true, desc = 'Vertiacl split', noremap = true })
-- switch between windows
vim.keymap.set({ 'n', 'v', 'o' }, '<c-h>', '<c-w>h', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v', 'o' }, '<c-l>', '<c-w>l', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v', 'o' }, '<c-j>', '<c-w>j', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v', 'o' }, '<c-k>', '<c-w>k', { silent = true, noremap = true })

-- line numbers
vim.keymap.set('n', '<leader>nn', '<cmd> set nu! <cr>', { silent = true, desc = 'Toggle line number' })
vim.keymap.set('n', '<leader>ii', '<cmd> set rnu! <cr>', { silent = true, desc = 'Toggle relative number' })
vim.keymap.set('n', '<leader>ll', '<cmd> set invlist <cr>', { silent = true, desc = 'Toggle list chars' })
vim.keymap.set('n', '<leader>pp', '<cmd> set invpaste <cr>', { silent = true, desc = 'Toggle paste mode' })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
vim.keymap.set('v', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- go to  beginning and end
vim.keymap.set('i', '<c-b>', '<esc>^i', { desc = 'Beginning of line' })
vim.keymap.set('i', '<c-e>', '<end>', { desc = 'End of line' })
-- navigate within insert mode
vim.keymap.set('i', '<c-h>', '<left>', { desc = 'Move left' })
vim.keymap.set('i', '<c-l>', '<right>', { desc = 'Move right' })
vim.keymap.set('i', '<c-j>', '<down>', { desc = 'Move down' })
vim.keymap.set('i', '<c-k>', '<up>', { desc = 'Move up' })

-- Keep the cursor in place while joining lines
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })
-- Indent/dedent/autoindent what you just pasted.
vim.keymap.set('n', '<lt>>', 'V`]<', { noremap = true })
vim.keymap.set('n', '><lt>', 'V`]>', { noremap = true })
vim.keymap.set('n', '=-', 'V`]=', { noremap = true })

-- Split line (sister to [J]oin lines)
-- The normal use of S is covered by cc, so don't worry about shadowing it.
vim.keymap.set('n', 'S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w', { noremap = true })

-- Don't jump when using * for search
vim.keymap.set('n', '*', '*<c-o>', { noremap = true })

-- Keep search matches in the middle of the window.
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true })

-- Same when jumping around
vim.keymap.set('n', 'g;', 'g;zz', { noremap = true })
vim.keymap.set('n', 'g,', 'g,zz', { noremap = true })
vim.keymap.set('n', '<c-o>', '<c-o>zz', { noremap = true })

-- Reselect visual block after indent/outdent
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- Reselect last-pasted text
vim.keymap.set('n', 'gp', '`[v`]', { noremap = true })

-- gi already moves to "last place you exited insert mode", so we'll map gI to
-- something similar: move to last change
vim.keymap.set('n', 'gI', '`.', { noremap = true })
