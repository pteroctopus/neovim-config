return {
  "rose-pine/neovim",
  priority = 1000,
  enabled = true,
  config = function(_, opts)
    require("rose-pine").setup(opts)
  end,
  opts = {
    palette = {
      main = {
        base = "#000000",
      },
    },
    highlight_groups = {
      Visual = { bg = "iris", fg = "base", inherit = false, blend = 100 },
      Search = { bg = "gold", fg = "base", inherit = false, blend = 70 },
    },
    styles = {
      bold = true,
      italic = false,
      transparency = false,
    },
  },
}
