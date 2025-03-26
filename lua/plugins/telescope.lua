local telescope_keymaps = function()
  -- See `:help telescope.builtin`
  return {
    { '<localleader>?',       '<cmd>Telescope oldfiles<cr>',                  mode = 'n', desc = '[T] Find recently opened files' },
    { '<localleader><space>', '<cmd>Telescope buffers<cr>',                   mode = 'n', desc = '[T] Find existing buffers' },
    { '<localleader>gf',      '<cmd>Telescope git_files<cr>',                 mode = 'n', desc = '[T] Search Git Files' },
    { '<localleader>sf',      '<cmd>Telescope find_files<cr>',                mode = 'n', desc = '[T] Search Files' },
    { '<localleader>sh',      '<cmd>Telescope help_tags<cr>',                 mode = 'n', desc = '[T] Search Help' },
    { '<localleader>sw',      '<cmd>Telescope grep_string<cr>',               mode = 'n', desc = '[T] Search current Word' },
    { '<localleader>sg',      '<cmd>Telescope live_grep<cr>',                 mode = 'n', desc = '[T] Search by Grep' },
    { '<localleader>sd',      '<cmd>Telescope diagnostics<cr>',               mode = 'n', desc = '[T] Search Diagnostics' },
    { '<localleader>sr',      '<cmd>Telescope resume<cr>',                    mode = 'n', desc = '[T] Resume Picker' },
    { '<localleader>sk',      '<cmd>Telescope keymaps<cr>',                   mode = 'n', desc = '[T] Search keymaps' },
    { '<localleader>sq',      '<cmd>Telescope quickfix<cr>',                  mode = 'n', desc = '[T] Search Quickfix list' },
    { '<localleader>sR',      '<cmd>Telescope registers<cr>',                 mode = 'n', desc = '[T] Search Registers' },
    { '<localleader>sM',      '<cmd>Telescope marks<cr>',                     mode = 'n', desc = '[T] Search Marks' },
    { '<localleader>/',       '<cmd>Telescope current_buffer_fuzzy_find<cr>', mode = 'n', desc = '[T] Fuzzily search in current buffer' },
  }
end


return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
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
    config = function(_, opts)
      pcall(require('telescope').load_extension, 'fzf')
      -- pcall(require('telescope').load_extension, 'live_grep_args')
    end,
    keys = telescope_keymaps(),
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
