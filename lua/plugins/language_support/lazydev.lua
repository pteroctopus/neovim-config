-- doesn't load every time if lazy is true and if we remove priority
-- need to see why this is happening
-- for now workaround with priority works
return {
  {
    "folke/lazydev.nvim",
    priority = 1001,
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
