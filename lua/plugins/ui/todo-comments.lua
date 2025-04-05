return {
  "folke/todo-comments.nvim",
  lazy = true,
  event = { "VeryLazy" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },

    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]],
    },
    search = {
      pattern = [[\b(KEYWORDS)\b]],
    },
  },
  keys = {
    { "<leader>xc", "<cmd>TodoTrouble<cr>", desc = "[TC] Toggle Todo comments", silent = true },
  },
}
