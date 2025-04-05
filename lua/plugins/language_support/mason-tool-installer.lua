return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  lazy = true,
  cmd = {
    "MasonToolsClean",
    "MasonToolsInstall",
    "MasonToolsInstallSync",
    "MasonToolsUpdate",
    "MasonToolsUpdateSync",
  },
  opts = {
    ensure_installed = {
      "black",
      "isort",
      "prettier",
      "prettierd",
      "stylua",
      "shfmt",
      "hclfmt",
    },
  },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
}
