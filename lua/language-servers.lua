-- LSP settings.

-- Disable lsp logs
vim.lsp.set_log_level("off")
--vim.lsp.set_log_level("debug")

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)

  require('keymaps').language_servers(bufnr)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  -- clangd = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  -- https://github.com/mrjosh/helm-ls
  helm_ls = {},

  gopls = {},

  -- Ansible language server
  ansiblels = {
    ansible = {
      ansible = {
        path = 'ansible'
      },
      executionEnvironment = {
        enabled = false
      },
      python = {
        interpreterPath = 'python'
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = 'ansible-lint'
        }
      }
    }
  },

  terraformls = {},

  -- Yaml language server
  yamlls = {
    yaml = {
      schemas = {
        -- helm unittest
        ["https://raw.githubusercontent.com/helm-unittest/helm-unittest/v0.4.1/schema/helm-testsuite.json"] = "tests/*_test.yaml",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/helmfile.json"] = "helmfile.{yml,yaml}",
        kubernetes = {
          '*.kube.yml',
          '*.kube.yaml',
          '*kubectl-edit-*.yaml',
          '*role*/templates/create*.y*ml',
        }
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
    }
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
  lemminx = {},

  -- Vim language server
  vimls = {},
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
