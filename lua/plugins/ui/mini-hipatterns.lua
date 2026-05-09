return {
  "nvim-mini/mini.hipatterns",
  version = "*",
  event = "VeryLazy",
  opts = function()
    return {
      highlighters = {
        -- Use word-boundary frontier patterns so e.g. "TODOs" doesn't match.
        fixme   = { pattern = "%f[%w]()FIXME()%f[%W]",   group = "MiniHipatternsFixme" },
        bug     = { pattern = "%f[%w]()BUG()%f[%W]",     group = "MiniHipatternsFixme" },
        hack    = { pattern = "%f[%w]()HACK()%f[%W]",    group = "MiniHipatternsHack" },
        xxx     = { pattern = "%f[%w]()XXX()%f[%W]",     group = "MiniHipatternsHack" },
        warning = { pattern = "%f[%w]()WARNING()%f[%W]", group = "MiniHipatternsHack" },
        todo    = { pattern = "%f[%w]()TODO()%f[%W]",    group = "MiniHipatternsTodo" },
        note    = { pattern = "%f[%w]()NOTE()%f[%W]",    group = "MiniHipatternsNote" },
        info    = { pattern = "%f[%w]()INFO()%f[%W]",    group = "MiniHipatternsNote" },
      },
    }
  end,
}
