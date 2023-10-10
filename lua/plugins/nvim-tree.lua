-- Disable netrw if nvim-tree plugin is used
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Neovim file browser plugin
return {
  'kyazdani42/nvim-tree.lua',
  opts = {
    view = {
      width = 30,
    }
  },
  keys = require('keymaps').nvim_tree,
}
