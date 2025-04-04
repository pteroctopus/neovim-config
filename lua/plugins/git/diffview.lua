return {
  'sindrets/diffview.nvim',
  lazy = true,
  cmd = {
    'DiffviewOpen',
    'DiffviewClose',
    'DiffviewFileHistory',
    'DiffviewFocusFiles',
    'DiffviewLog',
    'DiffviewRefresh',
    'DiffviewToggleFiles',
  },

  config = function(_, opts)
    local actions = require('diffview.actions')
    vim.keymap.set('n', '<leader>j', actions.select_next_entry, { desc = '[DV] Open diff for the next file' })
    vim.keymap.set('n', '<leader>k', actions.select_prev_entry, { desc = '[DV] Open diff for the previous file' })
  end,

  keys = {
    { '<leader>go', ':DiffviewOpen<cr>',            desc = '[DV] Diff View Open',                                  silent = true },
    { '<leader>gO', ':DiffviewOpen <c-r>+<cr><cr>', desc = '[DV] Diff View Open with commit hash from " register', silent = true },
    { '<leader>gh', ':DiffviewFileHistory<cr>',     desc = '[DV] Diff File History',                               silent = true },
    { '<leader>gc', ':DiffviewClose<cr>',           desc = '[DV] Diff View Close',                                 silent = true },
  },
}
