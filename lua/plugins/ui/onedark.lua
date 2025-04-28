-----------------------------
-- CUSTOMIZED DEEP STYLE --
-----------------------------

-- return {
--   "navarasu/onedark.nvim",
--   priority = 1000,
--   opts = {
--     style = "deep",
--     colors = {
--       black = "#07080b",
--       bg0 = "#000000",
--       bg1 = "#10131b",
--       bg2 = "#181c1f",
--       bg3 = "#172a3a",
--       bg_d = "#0c0e10",
--     },
--     highlights = {
--       MatchParen = { fg = "#e8c88c", fmt = "bold" },
--       Visual = { bg = "#274964" },
--       IlluminatedWordText = { bg = "#172a3a" },
--       IlluminatedWordRead = { bg = "#172a3a" },
--       IlluminatedWordWrite = { bg = "#172a3a" },
--       TreesitterContext = { bg = "#172a3a" },
--     },
--   },
-- }

-----------------------------------
-- CUSTOMIZED DEEP STYLE TO MONO --
-----------------------------------

-- return {
--   "navarasu/onedark.nvim",
--   priority = 1000,
--   opts = {
--     style = "deep",
--     colors = {
--       black = "#0d0d0d",
--       bg0 = "#000000",
--       bg1 = "#272727",
--       bg2 = "#2f2f2f",
--       bg3 = "#313131",
--       bg_d = "#191919",
--       bg_blue = "#a1a1a1",
--       bg_yellow = "#d1d1d1",
--       fg = "#a7a7a7",
--       purple = "#9e9e9e",
--       green = "#a5a5a5",
--       orange = "#b4b4b4",
--       blue = "#8e8e8e",
--       yellow = "#cfcfcf",
--       cyan = "#9c9c9c",
--       red = "#b3b3b3",
--       grey = "#5a5a5a",
--       light_grey = "#838383",
--       dark_cyan = "#2e2e2e",
--       dark_red = "#4c4c4c",
--       dark_yellow = "#4e4e4e",
--       dark_purple = "#4e4e4e",
--       diff_add = "#27341c",
--       diff_delete = "#331c1e",
--       diff_change = "#102b40",
--       diff_text = "#1c4a6e",
--     },
--     highlights = {
--       MatchParen = { fg = "#e8c88c", fmt = "bold" },
--       Visual = { bg = "#274964" },
--       IlluminatedWordText = { bg = "#172a3a" },
--       IlluminatedWordRead = { bg = "#172a3a" },
--       IlluminatedWordWrite = { bg = "#172a3a" },
--       TreesitterContext = { bg = "#172a3a" },
--     },
--   },
-- }

-----------------------------
-- CUSTOMIZED DARKER STYLE --
-----------------------------

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
