return {
  enabled = true,
  lazy = true,
  event = "VeryLazy",
  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",
  -- See `:help lualine.txt`
  opts = {
    options = {
      component_separators = "|",
      section_separators = "",
      theme = "auto",
      disabled_filetypes = {
        -- nvim-dap-ui plugin buffer filetypes for debug windows
        "dap-repl",
        "dapui_console",
        "dapui_scopes",
        "dapui_breakpoints",
        "dapui_stacks",
        "dapui_watches",
      },
    },
    -- winbar is owned by dropbar.nvim
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = {
        {
          icons_enabled = true,
          icon = "",
          function()
            return vim.api.nvim_buf_line_count(0)
          end,
        },
        {
          icons_enabled = true,
          icon = "",
          "filesize",
        },
        "encoding",
        "fileformat",
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    tabline = {
      lualine_a = {
        { "buffers" },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
        function()
          return " " .. vim.fn.getcwd()
        end,
      },
      lualine_z = { "tabs" },
    },
  },
}
