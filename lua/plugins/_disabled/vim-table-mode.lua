vim.keymap.set("n", "<leader>tr", ':TableModeRealign<cr>', { desc = '[VTM] Format table' })

return {
  enabled = false,
  'dhruvasagar/vim-table-mode',
  lazy = true,
  event = 'VeryLazy',
}
