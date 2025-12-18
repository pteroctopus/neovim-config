return {
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  enabled = true,
  lazy = true,
  event = "VeryLazy",
  keys = {
    { "<leader>gp", ":Gitsigns prev_hunk<cr>", desc = "[GS] Go to Previous Hunk", silent = true },
    { "<leader>gn", ":Gitsigns next_hunk<cr>", desc = "[GS] Go to Next Hunk", silent = true },
    { "<leader>gP", ":Gitsigns preview_hunk<cr>", desc = "[GS] Preview Hunk", silent = true },
    { "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", desc = "[GS] Current line blame", silent = true },
  },
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },

    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      --delay = 1000,
      delay = 50,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  },
}
