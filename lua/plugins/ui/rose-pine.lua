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
        -- _nc = "#16141f",
        base = "#000000",
        -- surface = "#1f1d2e",
        -- overlay = "#26233a",
        -- muted = "#6e6a86",
        -- subtle = "#908caa",
        -- text = "#e0def4",
        -- love = "#eb6f92",
        -- gold = "#f6c177",
        -- rose = "#ebbcba",
        -- pine = "#31748f",
        -- foam = "#9ccfd8",
        -- iris = "#c4a7e7",
        -- leaf = "#95b1ac",
        -- highlight_low = "#21202e",
        -- highlight_med = "#403d52",
        -- highlight_high = "#524f67",
        -- none = "NONE",
        xxx = "#ffff00"
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
      TelescopeBorder = { fg = "muted", bg = "base" },
      NormalFloat = { bg = "base" },
    },
    styles = {
      bold = true,
      italic = false,
      transparency = false,
    },
  },
}
