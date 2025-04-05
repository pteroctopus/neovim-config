return {
  -- Theme inspired by Atom
  "navarasu/onedark.nvim",
  priority = 1000,
  opts = {
    -- colors = {
    --   -- used for background
    --   bg0 = '#16191d',   -- a little darker default
    --   -- used for cursor line and column
    --   bg1 = '#21252b'    -- a little darker default
    -- },

    colors = {
      black = "#07080b",
      bg0 = "#000000",
      bg1 = "#10131b",
      bg2 = "#181c1f",
      --bg3 = "#191a20",
      --bg3 = '#1f2329',
      bg3 = "#172a3a",
      bg_d = "#0c0e10",
      bg_blue = "#61afef",
      bg_yellow = "#e8c88c",
      fg = "#a0a8b7",
      purple = "#bf68d9",
      green = "#8ebd6b",
      orange = "#cc9057",
      blue = "#4fa6ed",
      yellow = "#e2b86b",
      cyan = "#48b0bd",
      red = "#e55561",
      grey = "#52565e",
      light_grey = "#4d525c",
      dark_cyan = "#266269",
      dark_red = "#8b3434",
      dark_yellow = "#835d1a",
      dark_purple = "#7e3992",
      diff_add = "#272e23",
      diff_delete = "#2d2223",
      diff_change = "#172a3a",
      diff_text = "#274964",
    },

    highlights = {
      MatchParen = { fg = "#e8c88c", fmt = "bold" },
      Visual = { bg = "#274964" },
      IlluminatedWordText = { bg = "#172a3a" },
      IlluminatedWordRead = { bg = "#172a3a" },
      IlluminatedWordWrite = { bg = "#172a3a" },
      TreesitterContext = { bg = "#172a3a" },
    },

    style = "darker",
  },
}
