return {
  "MeanderingProgrammer/render-markdown.nvim",
  lazy = true,
  cmd = { "RenderMarkdown" },
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}
