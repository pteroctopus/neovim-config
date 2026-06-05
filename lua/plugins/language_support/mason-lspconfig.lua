return {
  "mason-org/mason-lspconfig.nvim",
  lazy = true,
  opts = {
    ensure_installed = {
      "yamlls",
      "gopls",
      "ansiblels",
      "terraformls",
      "pyright",
      "lua_ls",
      "dockerls",
      "bashls",
      "html",
      "cssls",
      "jsonls",
      "ts_ls",
      "marksman",
      "vimls",
      "helm_ls",
      "groovyls",
    },
    -- Auto-enable installed servers via vim.lsp.enable; configs come from <rtp>/lsp/*.lua
    automatic_enable = true,
  },
}
