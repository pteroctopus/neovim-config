return {
  "folke/trouble.nvim",
  lazy = true,
  cmd = "Trouble",
  dependencies = {
    "nvim-mini/mini.icons",
  },
  opts = {},
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "[TR] Diagnostics (Trouble)" },
  },
}
