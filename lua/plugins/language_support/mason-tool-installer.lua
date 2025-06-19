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
      "mdformat",
      "yamlfmt",
      "jq",
    },
  },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
}
