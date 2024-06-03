return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      --
      -- -- Live grep args picker for telescope.nvim.
      -- -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
      -- {
      --   "nvim-telescope/telescope-live-grep-args.nvim",
      --   version = "^1.0.0",
      -- },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    },
    config = function (_, opts)
      pcall(require('telescope').load_extension, 'fzf')
      -- pcall(require('telescope').load_extension, 'live_grep_args')
    end,
    keys = require('keymaps').telescope
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
