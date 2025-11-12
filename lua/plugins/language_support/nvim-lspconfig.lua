local language_server_keymaps = function(bufnr)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "[L] Rename" })
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "[L] Code Action" })

  vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { buffer = bufnr, desc = "[L] Goto Definition" })

  vim.keymap.set(
    "n",
    "<leader>lf",
    require("telescope.builtin").lsp_references,
    { buffer = bufnr, desc = "[L] Goto References" }
  )
  vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { buffer = bufnr, desc = "[L] Goto Implementation" })
  vim.keymap.set("n", "<leader>lD", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "[L] Type Definition" })
  vim.keymap.set(
    "n",
    "<leader>ls",
    require("telescope.builtin").lsp_document_symbols,
    { buffer = bufnr, desc = "[L] Document Symbols" }
  )
  vim.keymap.set(
    "n",
    "<leader>lv",
    require("telescope.builtin").lsp_dynamic_workspace_symbols,
    { buffer = bufnr, desc = "[L] Workspace Symbols" }
  )

  -- See `:help K` for why this keymap
  vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, { buffer = bufnr, desc = "[L] Hover Documentation" })
  vim.keymap.set(
    "n",
    "<leader>lS",
    vim.lsp.buf.signature_help,
    { buffer = bufnr, desc = "[L] Signature Documentation" }
  )

  -- Lesser used LSP functionality
  vim.keymap.set("n", "<leader>ll", vim.lsp.buf.declaration, { buffer = bufnr, desc = "[L] Goto Declaration" })
  vim.keymap.set(
    "n",
    "<leader>lwa",
    vim.lsp.buf.add_workspace_folder,
    { buffer = bufnr, desc = "[L] Workspace Add Folder" }
  )
  vim.keymap.set(
    "n",
    "<leader>lwr",
    vim.lsp.buf.remove_workspace_folder,
    { buffer = bufnr, desc = "[L] Workspace Remove Folder" }
  )
  vim.keymap.set("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr, desc = "[L] Workspace List Folders" })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', {
  capabilities = capabilities,
  root_markers = { '.git' },
  -- on_attach = function(client, bufnr)
  --   if client.server_capabilities.documentSymbolProvider then
  --     navic.attach(client, bufnr)
  --   end
  --end
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('pteroctopus-lsp-attach', { clear = true }),
  callback = function(event)
    language_server_keymaps(event.buf)
  end
})

return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    -- "hrsh7th/nvim-cmp",
    -- "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- Useful status updates for LSP
    "j-hui/fidget.nvim",
  },
}
