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
        kubernetes = {
          '*.kube.yml',
          '*.kube.yaml',
          '*kubectl-edit-*.yaml',
          '*role*/templates/create*.y*ml',
        }
      }
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

-- TODO: Workaround (2024-03-29): When yaml file is opened that should be handled by helm_ls language server.
-- Only helm_ls client should be started. Because helm template can be .yaml file yamlls will also be started.
-- This autocommand will stop yamlls client if filetype is helm.
-- This should be solved differently, yamlls shoudn't be started at all. Check if there is some option for that
-- implemented in helm_ls at some point.

vim.api.nvim_create_autocmd(
  'LspAttach',
  {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if vim.bo[args.buf].filetype == 'helm' and client.name == 'yamlls' then
        vim.cmd('LspStop ' .. args.data.client_id)
      end
    end
  }
)
