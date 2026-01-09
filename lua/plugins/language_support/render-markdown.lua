return {
  "MeanderingProgrammer/render-markdown.nvim",
  lazy = true,
  cmd = { "RenderMarkdown" },
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.icons",
  },
  keys = {
    { "<leader>rm", "<cmd>RenderMarkdown toggle<cr>", desc = "[RM] Render Markdown" },
  },

  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    enabled = false,
  },
}
