-- TODO This is a workaround (see how to do it correctly)!! because of nvim-navic plugin.
-- It needs language server support to generate breadcrumbs and ansiblels doesn't have it.
-- This autocommand will change the filetype of yaml.ansible file to yaml so that yamlls language server
-- starts also and switch back filetype to yaml.ansible
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name == "ansiblels" then
      vim.bo[args.buf].filetype = "yaml"
      vim.bo[args.buf].filetype = "yaml.ansible"
    end
  end,
})

-- Plugin configuration
return {
  "SmiteshP/nvim-navic",
  enabled = true,
  lazy = true,
  event = "LspAttach",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = {
    highlight = true,
    lsp = {
      auto_attach = true,
      preference = {
        "yamlls",
        "ansiblels",
        "helm_ls",
      },
    },
  },
}
