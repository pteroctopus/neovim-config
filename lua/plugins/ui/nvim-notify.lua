return {
  "rcarriga/nvim-notify",
  lazy = true,
  event = "VeryLazy",
  config = function()
    vim.notify = require("notify")
  end,
}
