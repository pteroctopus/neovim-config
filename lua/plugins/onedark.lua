return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  opts = {
    colors = {
      -- used for background
      bg0 = '#16191d',   -- a little darker default
      -- used for cursor line and column
      bg1 = '#21252b'    -- a little darker default
    },
    highlights = {
      MatchParen = { fg = '#e8c88c', fmt = "bold" },
    },
    style = 'darker',
  }
}
