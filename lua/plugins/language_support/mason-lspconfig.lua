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

local servers = {
  -- clangd = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  groovyls = {},

  -- https://github.com/mrjosh/helm-ls
  helm_ls = {},

  gopls = {},

  -- Ansible language server
  ansiblels = {
    ansible = {
      ansible = {
        path = "ansible",
      },
      executionEnvironment = {
        enabled = false,
      },
      python = {
        interpreterPath = "python",
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint",
        },
      },
    },
  },

  terraformls = {},

  -- Yaml language server
  yamlls = {
    yaml = {
      schemas = {
        -- ["file:///Users/goran.novak/Development/github/kubeconform/scripts/crdtest.json"] = "*.x.yaml",
        -- helm unittest
        ["https://raw.githubusercontent.com/helm-unittest/helm-unittest/v0.4.1/schema/helm-testsuite.json"] = "tests/*_test.yaml",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/helmfile.json"] = "helmfile.{yml,yaml}",
        kubernetes = {
          -- '*.yaml',
          --
          "*.kube.yml",
          "*.kube.yaml",
          "*kubectl-edit-*.yaml",
          "*role*/templates/create*.y*ml",
        },
      },
      schemaStore = {
        enable = true,
      },
      validate = true,
      completion = true,
      hover = true,
      format = {
        enable = true,
      },
    },
  },

  -- Python language server
  pyright = {},

  -- Lua language server
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },

  -- Dockerfile language server
  dockerls = {},

  -- Docker compose language service
  --docker_compose_language_service = {},

  -- Bash language server
  bashls = {},

  -- AWK language server (https://github.com/Beaglefoot/awk-language-server/)
  awk_ls = {},

  -- HTML language server (https://github.com/hrsh7th/vscode-langservers-extracted)
  html = {},

  -- CSS language server (https://github.com/hrsh7th/vscode-langservers-extracted)
  cssls = {},

  -- JSON language server (https://github.com/hrsh7th/vscode-langservers-extracted)
  jsonls = {},

  -- Markdown language server
  marksman = {},

  -- Remark markdown language server
  --remark_ls = {},

  -- XML Language server
  -- lemminx = {},

  -- Vim language server
  vimls = {},
}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(client, bufnr)
  language_server_keymaps(bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

local handlers = {
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = on_attach,
      settings = servers[server_name],
    })
  end,
}

return {
  "mason-org/mason-lspconfig.nvim",
  lazy = true,
  opts = {
    ensure_installed = vim.tbl_keys(servers),
    handlers = handlers,
  },
}
