return {
  'folke/trouble.nvim',
  lazy = true,
  cmd = 'Trouble',
  dependencies = {
    "echasnovski/mini.icons"
  },
  opts = {
  },
  keys = {
    { "<localleader>xd", "<cmd>Trouble diagnostics<cr>", desc = '[TR] Document diagnostics' },
    { "<localleader>xx", function() require('trouble').toggle('last') end, desc = '[TR] Toggle trouble' },
    { "<localleader>xw", "<cmd>Trouble workspace_diagnostics<cr>", desc = '[TR] Workspace diagnostics' },
    { "<localleader>xq", "<cmd>Trouble quickfix<cr>", desc = '[TR] Quickfix list' },
    { "<localleader>xl", "<cmd>Trouble loclist<cr>", desc = '[TR] Location list' },
    { "<localleader>xr", "<cmd>Trouble lsp_references<cr>", desc = '[TR] LSP references' },
  }
}
