vim.keymap.set('n', '<localleader>ho', function() require("CopilotChat").open() end, { desc = "[CopilotChat] Open Chat" })

vim.keymap.set('n', "<localleader>hq",
  function()
    local input = vim.fn.input("Quick Chat: ")
    if input ~= "" then
      require('CopilotChat').ask(input, { selection = require("CopilotChat.select").buffer })
    end
  end,
  { desc = "[CopilotChat] Quick chat" })

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  lazy = true,
  cmd = "CopilotChat",
  branch = "main",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
  },
  build = "make tiktoken",        -- Only on MacOS or Linux
  opts = {},
  keys = {
    { '<localleader>ho', function() require("CopilotChat").open() end, desc = "[CopilotChat] Open Chat" },

    {
      "<localleader>hq",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require('CopilotChat').ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end,
      desc = "[CopilotChat] Quick chat",
    },
  },
}
