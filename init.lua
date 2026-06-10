-- Based on kickstart.nvim: https://github.com/nvim-lua/kickstart.nvim
vim.loader.enable()

-- Disable LSP logs
vim.lsp.log.set_level("off")

-- Leader keys setup
-- (Must be before plugins are loaded)
vim.g.mapleader = " "

-- Nerd Font is available (drives diagnostic sign icons, etc.)
vim.g.have_nerd_font = true

-- Install package manager and plugins
require("package-manager")
-- Auto initialize plugins and configure them
require("lazy").setup({
  { import = "plugins" },
  { import = "plugins/language_support" },
  { import = "plugins/nav_edit" },
  { import = "plugins/ui" },
  { import = "plugins/git" },
  { import = "plugins/debugging" },
}, {
  -- Don't notify on config file changes (the popup is noisy).
  change_detection = { notify = false },
  performance = {
    rtp = {
      -- Disable unused built-in plugins (oil replaces netrw).
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "netrwPlugin",
      },
    },
  },
})

-- Changes to default neovim options
require("options")
-- Abbreviations
require("abbreviations")
-- Custom keymaps
require("keymaps")
-- Highlight on yank text object
require("yank-highlight")
-- Automatic window split resize
require("auto-split-resize")
-- Setup of additional filetypes
require("additional-filetypes")
-- Diagnostic config
require("diagnostic-config")
-- LSP: server configs in <rtp>/lsp/<name>.lua, enabled in nvim-lspconfig spec config()

-- Chosen theme
vim.cmd.colorscheme("rose-pine")

-- Neovide
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h18"
  -- vim.o.guifont = "0xProto Nerd Font:h18"
end
