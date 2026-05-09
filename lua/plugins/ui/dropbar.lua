return {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-mini/mini.icons",
  },
  keys = {
    {
      "<leader>b",
      function()
        require("dropbar.api").pick()
      end,
      desc = "[DB] Pick (drill-down symbol popup)",
    },
  },
  opts = {},
}
