-- Disable netrw if nvim-tree plugin is used
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Neovim file browser plugin
return {
  'kyazdani42/nvim-tree.lua',
  enabled = false,
  lazy = true,
  event = 'VeryLazy',
  opts = {
    view = {
      width = 30,
    }
  },
  keys = {
      { '<localleader>n', ':NvimTreeFindFileToggle<cr>', mode = 'n', { silent = true, desc = '[TR] Toggle nvim-tree' } },
  },
}
