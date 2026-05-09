return {
  enabled = true,
  "RRethy/vim-illuminate",
  lazy = true,
  event = "CursorHold",

  config = function(_, opts)
    require("illuminate").configure(opts)
  end,

  keys = {
    {
      "<leader>ln",
      function()
        require("illuminate").goto_next_reference()
      end,
      desc = "[I] Goto next reference",
    },
    {
      "<leader>lp",
      function()
        require("illuminate").goto_prev_reference()
      end,
      desc = "[I] Goto previous reference",
    },
  },

  opts = {
    delay = 100,
    filetypes_denylist = { "dirbuf", "dirvish", "fugitive", "oil" },
  },
}
