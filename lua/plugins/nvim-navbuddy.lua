-- Plugin configuration
return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
    'numToStr/Comment.nvim',
    'nvim-telescope/telescope.nvim'
  },
  opts = {
    lsp = {
      auto_attach = true,
      preference = nil,
    },
  },
  keys = require('keymaps').nvim_navbuddy,
}
