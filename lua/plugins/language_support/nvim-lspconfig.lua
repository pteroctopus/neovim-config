local language_server_keymaps = function(bufnr)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "[L] Rename" })
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "[L] Code Action" })

  vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { buffer = bufnr, desc = "[L] Goto Definition" })

  vim.keymap.set("n", "<leader>lf", function()
    require("telescope.builtin").lsp_references()
  end, { buffer = bufnr, desc = "[L] Goto References" })
  vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { buffer = bufnr, desc = "[L] Goto Implementation" })
  vim.keymap.set("n", "<leader>lD", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "[L] Type Definition" })
  vim.keymap.set("n", "<leader>ls", function()
    require("telescope.builtin").lsp_document_symbols()
  end, { buffer = bufnr, desc = "[L] Document Symbols" })
  vim.keymap.set("n", "<leader>lv", function()
    require("telescope.builtin").lsp_dynamic_workspace_symbols()
  end, { buffer = bufnr, desc = "[L] Workspace Symbols" })

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

-- Built-in completion: 0.12 auto-merges client capabilities.
vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('pteroctopus-lsp-attach', { clear = true }),
  callback = function(event)
    language_server_keymaps(event.buf)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then return end
    -- Completion is handled by blink.cmp.
    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end
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
    -- fidget.nvim self-loads on LspAttach.
    -- lazydev.nvim self-loads on FileType lua.
  },
  config = function()
    -- Servers are configured via <rtp>/lsp/<name>.lua and merged with
    -- nvim-lspconfig defaults (cmd, filetypes, root_markers).
    vim.lsp.enable({
      "yamlls",
      "ansiblels",
      "terraformls",
      "pyright",
      "lua_ls",
      "dockerls",
      "bashls",
      "awk_ls",
      "html",
      "cssls",
      "jsonls",
      "ts_ls",
      "marksman",
      "vimls",
      "gopls",
      "groovyls",
      "helm_ls",
    })
  end,
}
