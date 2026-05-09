return {
  "sindrets/diffview.nvim",
  lazy = true,
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewFocusFiles",
    "DiffviewLog",
    "DiffviewRefresh",
    "DiffviewToggleFiles",
  },

  keys = {
    { "<leader>go", ":DiffviewOpen<cr>", desc = "[DV] Diff View Open", silent = true },
    {
      "<leader>gO",
      ":DiffviewOpen <c-r>+<cr><cr>",
      desc = '[DV] Diff View Open with commit hash from " register',
      silent = true,
    },
    { "<leader>gh", ":DiffviewFileHistory<cr>", desc = "[DV] Diff File History", silent = true },
    { "<leader>gc", ":DiffviewClose<cr>",       desc = "[DV] Diff View Close",   silent = true },
    {
      "<leader>j",
      function() require("diffview.actions").select_next_entry() end,
      desc = "[DV] Open diff for the next file",
    },
    {
      "<leader>k",
      function() require("diffview.actions").select_prev_entry() end,
      desc = "[DV] Open diff for the previous file",
    },
  },
}
