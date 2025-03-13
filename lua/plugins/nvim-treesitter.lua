return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  opts = {
    -- Add languages to be installed here that you want installed for treesitter
    auto_install = true,
    ensure_installed = {
      'angular', 'awk', 'bash', 'c', 'c_sharp', 'cmake', 'cpp', 'css', 'csv', 'diff', 'dockerfile', 'dtd', 'editorconfig',
      'fish', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'go', 'goctl', 'gomod', 'gosum',
      'gotmpl', 'gowork', 'gpg', 'graphql', 'groovy', 'hcl', 'helm', 'hjson', 'html', 'http', 'hurl', 'java', 'javascript',
      'jq', 'json', 'json5', 'jsonc', 'jsonnet', 'kotlin', 'latex', 'lua', 'luadoc', 'make', 'markdown', 'markdown_inline',
      'nginx', 'nix', 'norg', 'org', 'passwd', 'pem', 'php', 'php_only', 'phpdoc', 'powershell', 'printf', 'promql',
      'properties', 'proto', 'python', 'regex', 'ruby', 'rust', 'scala', 'sql', 'ssh_config', 'strace', 'terraform', 'tmux',
      'toml', 'tsv', 'tsx', 'typescript', 'vim', 'vimdoc', 'xml', 'yaml', 'zathurarc', 'zig'
    },
    --ignore_install = { 'terraform' },

    highlight = { enable = true },
    indent = { enable = true, disable = { 'python' } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<c-backspace>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
