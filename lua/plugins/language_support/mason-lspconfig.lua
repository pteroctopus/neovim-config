return {
  "mason-org/mason-lspconfig.nvim",
  lazy = true,
  opts = {
    -- Single source of truth for the LSP server list: every server here is
    -- installed by Mason and enabled via automatic_enable. Per-server config
    -- lives in <rtp>/lsp/<name>.lua.
    ensure_installed = {
      "awk_ls",
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
