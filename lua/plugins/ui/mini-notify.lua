return {
  "nvim-mini/mini.notify",
  version = "*",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("mini.notify").setup()
    vim.notify = require("mini.notify").make_notify()
  end,
}
