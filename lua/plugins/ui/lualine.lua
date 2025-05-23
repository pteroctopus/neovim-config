return {
  enabled = true,
  -- lazy = true,
  -- event = "VeryLazy",
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
        -- nvim-tree plugin buffer
        "NvimTree",
        -- Trouble plugin window
        "Trouble",
      },
    },
    winbar = {
      lualine_b = {
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
      },
      lualine_c = {
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local clients = vim.lsp.get_clients({ bufnr = bufnr })
          if #clients > 0 then
            local navic = require("nvim-navic")
            if navic.is_available() then
              return navic.get_location({}, bufnr)
            end
          end
          return ""
        end,
      },
      lualine_x = {
        function()
          return vim.fn.expand("%:.")
        end,
      },
    },
    inactive_winbar = {
      lualine_b = {
        {
          icons_enabled = true,
          icon = "",
          function()
            return vim.api.nvim_buf_line_count(0)
          end,
        },
      },
      lualine_y = {
        "filename",
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    tabline = {
      lualine_a = {
        {
          "buffers",
          --max_length = vim.o.columns * 9/10,
          -- buffers_color = {
          --   active = { fg = "#a0a8b7", bg = "#172a3a", gui = "bold" },
          -- },
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
        function()
          return " " .. vim.fn.getcwd()
        end,
      },
      lualine_z = { "tabs" },
    },
  },
}
