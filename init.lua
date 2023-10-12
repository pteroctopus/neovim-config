-- This neovim configuration was created using kickstart.nvim as a starting template
-- Kickstart neovim configuration: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
-- Commit: d8b3b774bb642a9bdb2930f2ef0dd09e29a2f00c

-- Leader keys setup
-- (Must be before plugins are loaded)
vim.g.mapleader = '\t'
vim.g.maplocalleader = ' '

-- Install package manager and plugins
require('package-manager')
-- Auto initialize plugins and configure them
require('lazy').setup('plugins')
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
-- LSP on attach configuration
require('language-servers')
-- Setup of additional filetypes
require('additional-filetypes')
-- Setup custom text objects
require('text-objects')

-- Chosen theme
vim.cmd.colorscheme 'onedark'

-- Print location from which neovim configuration was loaded
print(os.getenv('MYVIMRC'))
