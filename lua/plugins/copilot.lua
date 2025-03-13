return {
  'zbirenbaum/copilot.lua',
  enabled = true,
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = '[[',
        jump_next = ']]',
        accept = '<CR>',
        refresh = 'gr',
        open = '<M-CR>'
      },
      layout = {
        position = 'bottom', -- | top | left | right
        ratio = 0.4
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        accept = '<c-h>',
        accept_line = '<c-b>',
        accept_word = '<c-v>',
        next = '<c-j>',
        prev = '<c-k>',
        dismiss = '<c-l>',
      },
    },
    filetypes = {
      yaml = true,
      helm = true,
      toml = true,
      json = true,
      lua = true,
      python = true,
      markdown = true,
      kube = true,
      docker = true,
      go = true,
      javascript = true,
      typescript = true,
      typescriptreact = true,
      javascriptreact = true,
      terraform = true,
      gitcommit = true,
      yml = true,
      sh = true,
      groovy = true,
      ["."] = false,
    },
    copilot_node_command = 'node', -- Node.js version must be > 18.x
    server_opts_overrides = {},
  },
}
