-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<localleader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<localleader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<localleader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<localleader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<localleader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<localleader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<localleader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<localleader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  -- clangd = {},
  -- gopls = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  -- Ansible language server
  ansiblels = {
    ansible = {
      ansible = {
        path = "ansible"
      },
      executionEnvironment = {
        enabled = false
      },
      python = {
        interpreterPath = "python"
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint"
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
          "*.kube.yml",
          "*.kube.yaml",
          "*kubectl-edit-*.yaml",
          "*role*/templates/create*.y*ml",
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
