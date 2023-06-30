-- [[ Line text object ]]
-- In line text object
vim.keymap.set( { 'o', 'v' }, 'il', ':<c-u>normal! $v^<cr>', { silent = true, noremap = true })
-- Arround line text object
vim.keymap.set( { 'o', 'v' }, 'al', ':<c-u>normal! $v0<cr>', { silent = true, noremap = true })
