-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Replace : and ;
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
-- Show full name and buffer of currently open file instead of short name
vim.keymap.set('n', '<C-g>', '2<C-g>')
-- Relative or absolute numbering settings
vim.keymap.set('n', '<leader>nu', function()
  vim.o.relativenumber = not vim.o.relativenumber
end)
-- Switch window
vim.keymap.set('n', '<leader><leader>', '<C-w><C-w>', { noremap = true })
-- Execute macro in register q from next line to the end of the file
vim.keymap.set('n', '<leader>q', ':.+1,$normal @q<cr>')
-- Tab list and nolist
vim.keymap.set('n', '<leader>1', ':set list!<cr>')
-- Buffer navigation
vim.keymap.set('n', '<leader>l', ':bnext<cr>')
vim.keymap.set('n', '<leader>h', ':bprevious<cr>')
vim.keymap.set('n', '<leader>b', ':ls<cr>:buffer')
-- Search highlight off
vim.keymap.set('n', '<leader>n', ':noh<cr>')
-- nvim-tree.lua mapping
vim.keymap.set('n', '<localleader>n', ':NvimTreeFindFileToggle<cr>')
vim.keymap.set('n', '<localleader>f', ':NvimTreeFindFile<cr>')
-- Remap Enter to also remove search highlight
vim.keymap.set('n', '<cr>', ':noh<cr><cr>')
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Format code
vim.keymap.set(
  'n', '<leader>f',
  function()
    if vim.bo.filetype == 'markdown' then
      vim.bo.textwidth = 80
      vim.o.colorcolumn = "80"
      vim.api.nvim_command(':w')
      vim.api.nvim_command(':silent !deno fmt %')
      print('Deno format complete')
    else
      vim.api.nvim_command(':Format')
    end
  end,
  { desc = '[f]ormat buffer with external tool of language server' }
)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>w', vim.diagnostic.setloclist)

-- Telescope plugin related mappings
-- See `:help telescope.builtin`
vim.keymap.set('n', '<localleader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<localleader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<localleader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<localleader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<localleader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<localleader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<localleader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<localleader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<localleader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<localleader>sr', require('telescope.builtin').resume, { desc = '[R]esume [P]icker' })

-- Textcase plugin related mappings
vim.keymap.set('n', 'gas', function () require('textcase').current_word('to_snake_case') end, { desc = 'Change case to snake case'})
vim.keymap.set('n', 'gac', function () require('textcase').current_word('to_camel_case') end, { desc = 'Change case to camel case'})
vim.keymap.set('n', 'gau', function () require('textcase').current_word('to_upper_case') end, { desc = 'Change case to upper case'})
vim.keymap.set('n', 'gal', function () require('textcase').current_word('to_lower_case') end, { desc = 'Change case to lower case'})
vim.keymap.set('n', 'gah', function () require('textcase').current_word('to_dash_case') end, { desc = 'Change case to dash case'})
vim.keymap.set('n', 'gan', function () require('textcase').current_word('to_constant_case') end, { desc = 'Change case to constant case'})
vim.keymap.set('n', 'gad', function () require('textcase').current_word('to_dot_case') end, { desc = 'Change case to dot case'})
vim.keymap.set('n', 'gaa', function () require('textcase').current_word('to_phrase_case') end, { desc = 'Change case to phrase case'})
vim.keymap.set('n', 'gap', function () require('textcase').current_word('to_pascal_case') end, { desc = 'Change case to pascal case'})
vim.keymap.set('n', 'gat', function () require('textcase').current_word('to_title_case') end, { desc = 'Change case to title case'})
vim.keymap.set('n', 'gaf', function () require('textcase').current_word('to_path_case') end, { desc = 'Change case to path case'})

vim.keymap.set('n', 'gaS', function () require('textcase').lsp_rename('to_snake_case') end, { desc = 'Change variable case to snake case'})
vim.keymap.set('n', 'gaC', function () require('textcase').lsp_rename('to_camel_case') end, { desc = 'Change variable case to camel case'})
vim.keymap.set('n', 'gaU', function () require('textcase').lsp_rename('to_upper_case') end, { desc = 'Change variable to upper case'})
vim.keymap.set('n', 'gaL', function () require('textcase').lsp_rename('to_lower_case') end, { desc = 'Change variable to lower case'})
vim.keymap.set('n', 'gaH', function () require('textcase').lsp_rename('to_dash_case') end, { desc = 'Change variable to dash case'})
vim.keymap.set('n', 'gaN', function () require('textcase').lsp_rename('to_constant_case') end, { desc = 'Change variable to constant case'})
vim.keymap.set('n', 'gaD', function () require('textcase').lsp_rename('to_dot_case') end, { desc = 'Change variable to dot case'})
vim.keymap.set('n', 'gaA', function () require('textcase').lsp_rename('to_phrase_case') end, { desc = 'Change variable to phrase case'})
vim.keymap.set('n', 'gaP', function () require('textcase').lsp_rename('to_pascal_case') end, { desc = 'Change variable to pascal case'})
vim.keymap.set('n', 'gaT', function () require('textcase').lsp_rename('to_title_case') end, { desc = 'Change variable to title case'})
vim.keymap.set('n', 'gaF', function () require('textcase').lsp_rename('to_path_case') end, { desc = 'Change variable to path case'})

vim.keymap.set('n', 'ges', function () require('textcase').operator('to_snake_case') end, { desc = 'Change operator case to snake case'})
vim.keymap.set('n', 'gec', function () require('textcase').operator('to_camel_case') end, { desc = 'Change operator case to camel case'})
vim.keymap.set('n', 'geu', function () require('textcase').operator('to_upper_case') end, { desc = 'Change operator to upper case'})
vim.keymap.set('n', 'gel', function () require('textcase').operator('to_lower_case') end, { desc = 'Change operator to lower case'})
vim.keymap.set('n', 'geh', function () require('textcase').operator('to_dash_case') end, { desc = 'Change operator to dash case'})
vim.keymap.set('n', 'gen', function () require('textcase').operator('to_constant_case') end, { desc = 'Change operator to constant case'})
vim.keymap.set('n', 'ged', function () require('textcase').operator('to_dot_case') end, { desc = 'Change operator to dot case'})
vim.keymap.set('n', 'gea', function () require('textcase').operator('to_phrase_case') end, { desc = 'Change operator to phrase case'})
vim.keymap.set('n', 'gep', function () require('textcase').operator('to_pascal_case') end, { desc = 'Change operator to pascal case'})
vim.keymap.set('n', 'get', function () require('textcase').operator('to_title_case') end, { desc = 'Change operator to title case'})
vim.keymap.set('n', 'gef', function () require('textcase').operator('to_path_case') end, { desc = 'Change operator to path case'})
