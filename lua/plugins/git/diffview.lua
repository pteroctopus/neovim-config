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
    vim.keymap.set('n', '<localleader>j', actions.select_next_entry, { desc = '[DV] Open diff for the next file' })
    vim.keymap.set('n', '<localleader>k', actions.select_prev_entry, { desc = '[DV] Open diff for the previous file' })
  end,

  keys = {
    { '<localleader>go', ':DiffviewOpen<cr>',            desc = '[DV] Diff View Open',                                  silent = true },
    { '<localleader>gO', ':DiffviewOpen <c-r>+<cr><cr>', desc = '[DV] Diff View Open with commit hash from " register', silent = true },
    { '<localleader>gh', ':DiffviewFileHistory<cr>',     desc = '[DV] Diff File History',                               silent = true },
    { '<localleader>gc', ':DiffviewClose<cr>',           desc = '[DV] Diff View Close',                                 silent = true },
  },
}
