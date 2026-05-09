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
      -- Visual = { bg = "#312f48", inherit=false, blend = 100 },
      -- Visual = { bg = "gold", fg="base", inherit=false, blend = 100 },
      Visual = { bg = "iris", fg = "base", inherit = false, blend = 100 },
      -- Visual = { bg = "love", inherit=false, blend = 50 },
      -- Visual = { bg = "iris", inherit = false, blend = 35 },


      Search = { bg = "gold", fg = "base", inherit = false, blend = 70 },
      -- Telescope
      -- TelescopeBorder = { fg = "muted", bg = "base" },
      -- NormalFloat = { bg = "base" },
    },
    styles = {
      bold = true,
      italic = false,
      transparency = false,
    },
  },
}
