return {
  "lambdalisue/suda.vim",
  -- Not lazy on purpose: smart edit hooks BufEnter, and its main use case
  -- (opening an unreadable root-owned file) never fires BufReadPost, so an
  -- event trigger can miss it. The plugin is a few lines of vimscript.
  lazy = false,
  init = function()
    vim.g.suda_smart_edit = 1
  end,
}
