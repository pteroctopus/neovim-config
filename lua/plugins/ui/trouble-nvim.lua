return {
  "folke/trouble.nvim",
  lazy = true,
  cmd = "Trouble",
  dependencies = {
    "echasnovski/mini.icons",
  },
  opts = {},
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "[TR] Diagnostics (Trouble)" },
  },
}
