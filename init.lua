-- This neovim configuration was created using kickstart.nvim as a starting template
-- Kickstart neovim configuration: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
-- Commit: d8b3b774bb642a9bdb2930f2ef0dd09e29a2f00c

-- https://neovim.io/doc/user/lua.html#vim.loader
-- Enabled experimantal lua module loader befause of slowness of startup 1-5 seconds of customized neovim on corporate macos laptop.
-- This is for testing purposes to see if it helps.
-- Cause of slowness in unknown.
-- vim.loader.enable()

-- Disable LSP logs
vim.lsp.set_log_level("off")

-- Leader keys setup
-- (Must be before plugins are loaded)
vim.g.mapleader = '\t'
vim.g.maplocalleader = ' '

-- Install package manager and plugins
require('package-manager')
-- Auto initialize plugins and configure them
require('lazy').setup({
  { import = 'plugins' },
  { import = 'plugins/language_support' },
  { import = 'plugins/nav_edit' },
  { import = 'plugins/ui' },
  { import = 'plugins/git' },
  { import = 'plugins/copilot' },
  { import = 'plugins/debugging' },
})
-- Changes to default neovim options
require('options')
-- Abbreviations
require('abbreviations')
-- Custom keymaps
require('keymaps').basic()
-- Highlight on yank text object
require('yank-highlight')
-- Automatic window split resize
require('auto-split-resize')
-- Setup of additional filetypes
require('additional-filetypes')
-- Setup custom text objects
require('text-objects')

-- Chosen theme
vim.cmd.colorscheme 'onedark'

-- Neovide
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h18"
  -- vim.o.guifont = "0xProto Nerd Font:h18"
end

-- Print location from which neovim configuration was loaded
-- print(os.getenv('MYVIMRC'))
