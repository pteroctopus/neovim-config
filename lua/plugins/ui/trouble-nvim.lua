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
    { "<leader>xd", "<cmd>Trouble diagnostics<cr>", desc = '[TR] Document diagnostics' },
    { "<leader>xx", function() require('trouble').toggle('last') end, desc = '[TR] Toggle trouble' },
    { "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", desc = '[TR] Workspace diagnostics' },
    { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = '[TR] Quickfix list' },
    { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = '[TR] Location list' },
    { "<leader>xr", "<cmd>Trouble lsp_references<cr>", desc = '[TR] LSP references' },
  }
}
