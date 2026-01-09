return {
  "stevearc/aerial.nvim",
  enabled = false,
  lazy = true,
  event = "LspAttach",
  opts = {
    layout = {
      default_direction = "prefer_left",
    },
    -- filter_kind = false,
  },
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    -- "nvim-tree/nvim-web-devicons"
  },
}
