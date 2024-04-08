local keymaps = require('keymaps')

return {

  -- Debug adapter protocol client
  'mfussenegger/nvim-dap',

  dependencies = {

    -- UI for debugger
    {
      'rcarriga/nvim-dap-ui',
      dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
      -- stylua: ignore
      keys = function () return keymaps.nvim_dap_ui(require('dapui')) end,
      opts = {},
      config = function(_, opts)
        -- setup dap config by VsCode launch.json file
        --require('dap.ext.vscode').load_launchjs()
        local dap = require('dap')
        local dapui = require('dapui')
        dapui.setup(opts)
        dap.listeners.after.event_initialized['dapui_config'] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated['dapui_config'] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited['dapui_config'] = function()
          dapui.close({})
        end
      end,
    },
    -- virtual text for the debugger
    {
      'theHamsta/nvim-dap-virtual-text',
      opts = {},
    },

    -- which key integration
    {
      'folke/which-key.nvim',
      optional = true,
      opts = {
        defaults = {
          ['<localleader>d'] = { name = '+debug' },
          ['<localleader>da'] = { name = '+adapters' },
        },
      },
    },

    -- mason.nvim integration
    {
      'jay-babu/mason-nvim-dap.nvim',
      dependencies = 'mason.nvim',
      cmd = { 'DapInstall', 'DapUninstall' },
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        ensure_installed = {
          -- [[ Python]]
          -- Additional system requirements for python
          -- apt install python3.10-venv
          'python',
          -- [[ Bash ]]
          'bash',
          -- [[ Go ]]
          'delve',
        },
      },
    },
  },

  -- stylua: ignore
  keys = function () return keymaps.nvim_dap(require('dap'), require('dap.ui.widgets')) end,

  config = function()
    local icons = {
      dap = {
        Stopped = { '󰁕 ', 'DiagnosticWarn', 'DapStoppedLine' },
        Breakpoint = ' ',
        BreakpointCondition = ' ',
        BreakpointRejected = { ' ', 'DiagnosticError' },
        LogPoint = '.>',
      },
    }

    vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })

    for name, sign in pairs(icons.dap) do
      sign = type(sign) == 'table' and sign or { sign }
      vim.fn.sign_define(
        'Dap' .. name,
        { text = sign[1], texthl = sign[2] or 'DiagnosticInfo', linehl = sign[3], numhl = sign[3] }
      )
    end
  end,

}
