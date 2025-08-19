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

local handlers = {
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
