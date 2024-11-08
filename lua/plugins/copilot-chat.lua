vim.keymap.set('n', '<localleader>ho', function()
  require("CopilotChat").open()
end, { desc = "[CopilotChat] Open Chat" })

vim.keymap.set('n', "<localleader>hq",
  function()
    local input = vim.fn.input("Quick Chat: ")
    if input ~= "" then
      require('CopilotChat').ask(input, { selection = require("CopilotChat.select").buffer })
    end
  end,
  { desc = "[CopilotChat] Quick chat" })

-- CopilotChat - Help actionps
vim.keymap.set("n", "<localleader>hh", function()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.telescope").pick(actions.help_actions())
end, { desc = "CopilotChat - Help actions" })

-- CopilotChat - Prompt actions
vim.keymap.set("n", "<localleader>ha", function()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "CopilotChat - Prompt actions" })

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
  },
  build = "make tiktoken",        -- Only on MacOS or Linux
  opts = {
    -- debug = false, -- Enable debug logging
    -- proxy = nil, -- [protocol://]host[:port] Use this proxy
    -- allow_insecure = false, -- Allow insecure server connections

    -- system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
    model = 'gpt-4o', -- GPT model to use, 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o'
    temperature = 0.1, -- GPT temperature

    question_header = '## User ', -- Header to use for user questions
    answer_header = '## Copilot ', -- Header to use for AI answers
    error_header = '## Error ', -- Header to use for errors
    separator = '───', -- Separator to use in chat

    show_folds = true, -- Shows folds for sections in chat
    show_help = true, -- Shows help message as virtual lines when waiting for user input
    auto_follow_cursor = true, -- Auto-follow cursor in chat
    auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
    insert_at_end = false, -- Move cursor to end of buffer when inserting text
    clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
    highlight_selection = true, -- Highlight selection in the source buffer when in the chat window

    -- context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
    -- history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history
    -- callback = nil, -- Callback to use when ask response is received

    -- -- default selection (visual or line)
    -- selection = function(source)
    --   return select.visual(source) or select.line(source)
    -- end,

    -- default prompts
    -- prompts = {
    --   Explain = {
    --     prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
    --   },
    --   Review = {
    --     prompt = '/COPILOT_REVIEW Review the selected code.',
    --     callback = function(response, source)
    --       -- see config.lua for implementation
    --     end,
    --   },
    --   Fix = {
    --     prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
    --   },
    --   Optimize = {
    --     prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readability.',
    --   },
    --   Docs = {
    --     prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
    --   },
    --   Tests = {
    --     prompt = '/COPILOT_GENERATE Please generate tests for my code.',
    --   },
    --   FixDiagnostic = {
    --     prompt = 'Please assist with the following diagnostic issue in file:',
    --     selection = select.diagnostics,
    --   },
    --   Commit = {
    --     prompt =
    --     'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
    --     selection = select.gitdiff,
    --   },
    --   CommitStaged = {
    --     prompt =
    --     'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
    --     selection = function(source)
    --       return select.gitdiff(source, true)
    --     end,
    --   },
    -- },

    -- default window options
    window = {
      layout = 'vertical',    -- 'vertical', 'horizontal', 'float', 'replace'
      width = 0.5,            -- fractional width of parent, or absolute width in columns when > 1
      height = 0.5,           -- fractional height of parent, or absolute height in rows when > 1
      -- Options below only apply to floating windows
      relative = 'editor',    -- 'editor', 'win', 'cursor', 'mouse'
      border = 'single',      -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
      row = nil,              -- row position of the window, default is centered
      col = nil,              -- column position of the window, default is centered
      title = 'Copilot Chat', -- title of chat window
      footer = nil,           -- footer of chat window
      zindex = 1,             -- determines if window is on top or below other floating windows
    },

    -- default mappings
    mappings = {
      complete = {
        detail = 'Use @<Tab> or /<Tab> for options.',
        insert = '<Tab>',
      },
      close = {
        normal = 'q',
        insert = '<C-c>'
      },
      reset = {
        normal = '<C-l>',
        insert = '<C-l>'
      },
      submit_prompt = {
        normal = '<CR>',
        insert = '<C-s>'
      },
      accept_diff = {
        normal = '<C-y>',
        insert = '<C-y>'
      },
      yank_diff = {
        normal = 'gy',
        register = '"',
      },
      show_diff = {
        normal = 'gd'
      },
      show_system_prompt = {
        normal = 'gp'
      },
      show_user_selection = {
        normal = 'gs'
      },
    },
  },
}
