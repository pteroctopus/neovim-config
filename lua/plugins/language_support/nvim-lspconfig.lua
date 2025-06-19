return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    -- Useful status updates for LSP
    "j-hui/fidget.nvim",
  },
}
