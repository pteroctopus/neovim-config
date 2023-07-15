return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      component_separators = '|',
      section_separators = '',
      theme = 'auto'
    },
    winbar = {
      lualine_b = {
        function()
          return '☰ ' .. vim.api.nvim_buf_line_count(0)
        end
      },
      lualine_c = {
        function()
          local navic = require("nvim-navic")
          local bufnr = vim.api.nvim_get_current_buf()
          if navic.is_available(bufnr) then
            return navic.get_location({}, bufnr)
          else
            return ''
          end
        end
      },
      lualine_x = {
        function()
          return vim.fn.expand('%:.')
        end
      },
    },
    inactive_winbar = {
      lualine_b = {
        function()
          return '☰ ' .. vim.api.nvim_buf_line_count(0)
        end
      },
      lualine_y = {
        'filename'
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    tabline = {
      lualine_a = {
        {
          'buffers',
          --max_length = vim.o.columns * 9/10,
        }
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
        function()
          return ' ' .. vim.fn.getcwd()
        end,
      },
      lualine_z = { 'tabs' },
    },
  },
}
