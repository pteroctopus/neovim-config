local telescope_keymaps = function()
  -- See `:help telescope.builtin`
  return {
    { '<leader>?',       '<cmd>Telescope oldfiles<cr>',                  mode = 'n', desc = '[T] Find recently opened files' },
    { '<leader><space>', '<cmd>Telescope buffers<cr>',                   mode = 'n', desc = '[T] Find existing buffers' },
    { '<leader>gf',      '<cmd>Telescope git_files<cr>',                 mode = 'n', desc = '[T] Search Git Files' },
    { '<leader>sf',      '<cmd>Telescope find_files<cr>',                mode = 'n', desc = '[T] Search Files' },
    { '<leader>sh',      '<cmd>Telescope help_tags<cr>',                 mode = 'n', desc = '[T] Search Help' },
    { '<leader>sw',      '<cmd>Telescope grep_string<cr>',               mode = 'n', desc = '[T] Search current Word' },
    { '<leader>sg',      '<cmd>Telescope live_grep<cr>',                 mode = 'n', desc = '[T] Search by Grep' },
    { '<leader>sd',      '<cmd>Telescope diagnostics<cr>',               mode = 'n', desc = '[T] Search Diagnostics' },
    { '<leader>sr',      '<cmd>Telescope resume<cr>',                    mode = 'n', desc = '[T] Resume Picker' },
    { '<leader>sk',      '<cmd>Telescope keymaps<cr>',                   mode = 'n', desc = '[T] Search keymaps' },
    { '<leader>sq',      '<cmd>Telescope quickfix<cr>',                  mode = 'n', desc = '[T] Search Quickfix list' },
    { '<leader>sR',      '<cmd>Telescope registers<cr>',                 mode = 'n', desc = '[T] Search Registers' },
    { '<leader>sM',      '<cmd>Telescope marks<cr>',                     mode = 'n', desc = '[T] Search Marks' },
    { '<leader>/',       '<cmd>Telescope current_buffer_fuzzy_find<cr>', mode = 'n', desc = '[T] Fuzzily search in current buffer' },
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
