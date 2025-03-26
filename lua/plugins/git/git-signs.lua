return {
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  lazy = true,
  event = 'VeryLazy',
  keys = {
    { '<localleader>gp', ':Gitsigns prev_hunk<cr>',                 desc = '[GS] Go to Previous Hunk', silent = true },
    { '<localleader>gn', ':Gitsigns next_hunk<cr>',                 desc = '[GS] Go to Next Hunk',     silent = true },
    { '<localleader>gP', ':Gitsigns preview_hunk<cr>',              desc = '[GS] Preview Hunk',        silent = true },
    { '<localleader>gb', ':Gitsigns toggle_current_line_blame<cr>', desc = '[GS] Current line blame',  silent = true },
  },
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },

    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      --delay = 1000,
      delay = 50,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  },
}
