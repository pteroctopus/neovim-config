return {
  "nvim-mini/mini.align",
  version = "*",
  lazy = true,
  -- ga: align, gA: align with live preview (normal + visual). Replaces
  -- godlygeek/tabular's :Tabularize command-driven workflow.
  keys = {
    { "ga", mode = { "n", "x" } },
    { "gA", mode = { "n", "x" } },
  },
  opts = {},
}
