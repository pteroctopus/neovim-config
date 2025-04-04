return {

  -- Debug adapter protocol client
  'mfussenegger/nvim-dap',
  lazy = true,

  dependencies = {

    -- UI for debugger
    {
      'rcarriga/nvim-dap-ui',
      dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
      -- stylua: ignore
      keys = {
        { '<leader>du', function() require('dapui').toggle({}) end, desc = '[D] Dap UI' },
        { '<leader>de', function() require('dapui').eval() end,     desc = '[D] Eval',  mode = { 'n', 'v' } },
      },
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
          ['<leader>d'] = { name = '+debug' },
          ['<leader>da'] = { name = '+adapters' },
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
  keys = {
    { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = '[D] Breakpoint Condition' },
    { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = '[D] Toggle Breakpoint' },
    { '<leader>dc', function() require('dap').continue() end, desc = '[D] Continue' },
    { '<leader>dC', function() require('dap').run_to_cursor() end, desc = '[D] Run to Cursor' },
    { '<leader>dg', function() require('dap').goto_() end, desc = '[D] Go to line (no execute)' },
    { '<leader>di', function() require('dap').step_into() end, desc = '[D] Step Into' },
    { '<leader>dj', function() require('dap').down() end, desc = '[D] Down' },
    { '<leader>dk', function() require('dap').up() end, desc = '[D] Up' },
    { '<leader>dl', function() require('dap').run_last() end, desc = '[D] Run Last' },
    { '<leader>dO', function() require('dap').step_out() end, desc = '[D] Step Out' },
    { '<leader>do', function() require('dap').step_over() end, desc = '[D] Step Over' },
    { '<leader>dp', function() require('dap').pause() end, desc = '[D] Pause' },
    { '<leader>dr', function() require('dap').repl.toggle() end, desc = '[D] Toggle REPL' },
    { '<leader>ds', function() require('dap').session() end, desc = '[D] Session' },
    { '<leader>dt', function() require('dap').terminate() end, desc = '[D] Terminate' },
    { '<leader>dw', function() require('dap.ui.widgets').hover() end, desc = '[D] Widgets' },
  },

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
