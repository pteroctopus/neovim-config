require('keymaps').diffview()

return {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'rbong/vim-flog',

  {
    'sindrets/diffview.nvim',
  },

  {
    'wintermute-cell/gitignore.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
  },

}
