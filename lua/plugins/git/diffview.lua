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
    { "<leader>go", "<cmd>DiffviewOpen<cr>", desc = "[DV] Diff View Open" },
    {
      "<leader>gO",
      function() vim.cmd("DiffviewOpen " .. vim.fn.trim(vim.fn.getreg("+"))) end,
      desc = "[DV] Diff View Open with commit hash from + register",
    },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "[DV] Diff File History" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>",       desc = "[DV] Diff View Close" },
  },

  opts = function()
    local actions = require("diffview.actions")
    -- Buffer-local next/prev file navigation: only active inside Diffview
    -- buffers/panels, so <leader>j/<leader>k mean nothing elsewhere.
    local nav = {
      { "n", "<leader>j", actions.select_next_entry, { desc = "[DV] Open diff for the next file" } },
      { "n", "<leader>k", actions.select_prev_entry, { desc = "[DV] Open diff for the previous file" } },
    }
    return {
      keymaps = {
        view = nav,
        file_panel = nav,
        file_history_panel = nav,
      },
    }
  end,
}
