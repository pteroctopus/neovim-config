return {
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  enabled = true,
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gp", function() require("gitsigns").nav_hunk("prev") end, desc = "[GS] Go to Previous Hunk" },
    { "<leader>gn", function() require("gitsigns").nav_hunk("next") end, desc = "[GS] Go to Next Hunk" },
    { "<leader>gP", function() require("gitsigns").preview_hunk() end, desc = "[GS] Preview Hunk" },
    { "<leader>gb", function() require("gitsigns").toggle_current_line_blame() end, desc = "[GS] Current line blame" },
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
