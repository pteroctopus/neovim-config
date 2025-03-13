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
  branch = "main",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
  },
  build = "make tiktoken",        -- Only on MacOS or Linux
  opts = {
    -- -- Shared config starts here (can be passed to functions at runtime and configured via setup function)
    --
    -- system_prompt = 'COPILOT_INSTRUCTIONS', -- System prompt to use (can be specified manually in prompt via /).
    --
    -- model = 'gpt-4o', -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
    -- agent = 'copilot', -- Default agent to use, see ':CopilotChatAgents' for available agents (can be specified manually in prompt via @).
    -- context = nil, -- Default context or array of contexts to use (can be specified manually in prompt via #).
    -- sticky = nil, -- Default sticky prompt or array of sticky prompts to use at start of every new chat.
    --
    -- temperature = 0.1, -- GPT result temperature
    -- headless = false, -- Do not write to chat buffer and use history(useful for using callback for custom processing)
    -- callback = nil, -- Callback to use when ask response is received
    -- remember_as_sticky = true, -- Remember model/agent/context as sticky prompts when asking questions
    --
    -- -- default selection
    -- -- see select.lua for implementation
    -- selection = function(source)
    --   return select.visual(source) or select.buffer(source)
    -- end,
    --
    -- -- default window options
    -- window = {
    --   layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
    --   width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
    --   height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
    --   -- Options below only apply to floating windows
    --   relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
    --   border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    --   row = nil, -- row position of the window, default is centered
    --   col = nil, -- column position of the window, default is centered
    --   title = 'Copilot Chat', -- title of chat window
    --   footer = nil, -- footer of chat window
    --   zindex = 1, -- determines if window is on top or below other floating windows
    -- },
    --
    -- show_help = true, -- Shows help message as virtual lines when waiting for user input
    -- highlight_selection = true, -- Highlight selection
    -- highlight_headers = true, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)
    -- references_display = 'virtual', -- 'virtual', 'write', Display references in chat as virtual text or write to buffer
    -- auto_follow_cursor = true, -- Auto-follow cursor in chat
    -- auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
    -- insert_at_end = false, -- Move cursor to end of buffer when inserting text
    -- clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
    --
    -- -- Static config starts here (can be configured only via setup function)
    --
    -- debug = false, -- Enable debug logging (same as 'log_level = 'debug')
    -- log_level = 'info', -- Log level to use, 'trace', 'debug', 'info', 'warn', 'error', 'fatal'
    -- proxy = nil, -- [protocol://]host[:port] Use this proxy
    -- allow_insecure = false, -- Allow insecure server connections
    --
    -- chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)
    --
    -- log_path = vim.fn.stdpath('state') .. '/CopilotChat.log', -- Default path to log file
    -- history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history
    --
    -- question_header = '# User ', -- Header to use for user questions
    -- answer_header = '# Copilot ', -- Header to use for AI answers
    -- error_header = '# Error ', -- Header to use for errors
    -- separator = '───', -- Separator to use in chat
    --
    -- -- default providers
    -- -- see config/providers.lua for implementation
    -- providers = {
    --   copilot = {
    --   },
    --   github_models = {
    --   },
    --   copilot_embeddings = {
    --   },
    -- }
    --
    -- -- default contexts
    -- -- see config/contexts.lua for implementation
    -- contexts = {
    --   buffer = {
    --   },
    --   buffers = {
    --   },
    --   file = {
    --   },
    --   files = {
    --   },
    --   git = {
    --   },
    --   url = {
    --   },
    --   register = {
    --   },
    --   quickfix = {
    --   },
    --   system = {
    --   }
    -- },
    --
    -- -- default prompts
    -- -- see config/prompts.lua for implementation
    -- prompts = {
    --   Explain = {
    --     prompt = 'Write an explanation for the selected code as paragraphs of text.',
    --     system_prompt = 'COPILOT_EXPLAIN',
    --   },
    --   Review = {
    --     prompt = 'Review the selected code.',
    --     system_prompt = 'COPILOT_REVIEW',
    --   },
    --   Fix = {
    --     prompt = 'There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.',
    --   },
    --   Optimize = {
    --     prompt = 'Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.',
    --   },
    --   Docs = {
    --     prompt = 'Please add documentation comments to the selected code.',
    --   },
    --   Tests = {
    --     prompt = 'Please generate tests for my code.',
    --   },
    --   Commit = {
    --     prompt = 'Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.',
    --     context = 'git:staged',
    --   },
    -- },
    --
    -- -- default mappings
    -- -- see config/mappings.lua for implementation
    -- mappings = {
    --   complete = {
    --     insert = '<Tab>',
    --   },
    --   close = {
    --     normal = 'q',
    --     insert = '<C-c>',
    --   },
    --   reset = {
    --     normal = '<C-l>',
    --     insert = '<C-l>',
    --   },
    --   submit_prompt = {
    --     normal = '<CR>',
    --     insert = '<C-s>',
    --   },
    --   toggle_sticky = {
    --     normal = 'grr',
    --   },
    --   clear_stickies = {
    --     normal = 'grx',
    --   },
    --   accept_diff = {
    --     normal = '<C-y>',
    --     insert = '<C-y>',
    --   },
    --   jump_to_diff = {
    --     normal = 'gj',
    --   },
    --   quickfix_answers = {
    --     normal = 'gqa',
    --   },
    --   quickfix_diffs = {
    --     normal = 'gqd',
    --   },
    --   yank_diff = {
    --     normal = 'gy',
    --     register = '"', -- Default register to use for yanking
    --   },
    --   show_diff = {
    --     normal = 'gd',
    --     full_diff = false, -- Show full diff instead of unified diff when showing diff window
    --   },
    --   show_info = {
    --     normal = 'gi',
    --   },
    --   show_context = {
    --     normal = 'gc',
    --   },
    --   show_help = {
    --     normal = 'gh',
    --   },
    -- },
  }
  -- opts = {
  --   -- debug = false, -- Enable debug logging
  --   -- proxy = nil, -- [protocol://]host[:port] Use this proxy
  --   -- allow_insecure = false, -- Allow insecure server connections
  --
  --   -- system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
  --   model = 'gpt-4o', -- GPT model to use, 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o'
  --   temperature = 0.1, -- GPT temperature
  --
  --   question_header = '## User ', -- Header to use for user questions
  --   answer_header = '## Copilot ', -- Header to use for AI answers
  --   error_header = '## Error ', -- Header to use for errors
  --   separator = '───', -- Separator to use in chat
  --
  --   show_folds = true, -- Shows folds for sections in chat
  --   show_help = true, -- Shows help message as virtual lines when waiting for user input
  --   auto_follow_cursor = true, -- Auto-follow cursor in chat
  --   auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
  --   insert_at_end = false, -- Move cursor to end of buffer when inserting text
  --   clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
  --   highlight_selection = true, -- Highlight selection in the source buffer when in the chat window
  --
  --   -- context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
  --   -- history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history
  --   -- callback = nil, -- Callback to use when ask response is received
  --
  --   -- -- default selection (visual or line)
  --   -- selection = function(source)
  --   --   return select.visual(source) or select.line(source)
  --   -- end,
  --
  --   -- default prompts
  --   -- prompts = {
  --   --   Explain = {
  --   --     prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
  --   --   },
  --   --   Review = {
  --   --     prompt = '/COPILOT_REVIEW Review the selected code.',
  --   --     callback = function(response, source)
  --   --       -- see config.lua for implementation
  --   --     end,
  --   --   },
  --   --   Fix = {
  --   --     prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
  --   --   },
  --   --   Optimize = {
  --   --     prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readability.',
  --   --   },
  --   --   Docs = {
  --   --     prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
  --   --   },
  --   --   Tests = {
  --   --     prompt = '/COPILOT_GENERATE Please generate tests for my code.',
  --   --   },
  --   --   FixDiagnostic = {
  --   --     prompt = 'Please assist with the following diagnostic issue in file:',
  --   --     selection = select.diagnostics,
  --   --   },
  --   --   Commit = {
  --   --     prompt =
  --   --     'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
  --   --     selection = select.gitdiff,
  --   --   },
  --   --   CommitStaged = {
  --   --     prompt =
  --   --     'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
  --   --     selection = function(source)
  --   --       return select.gitdiff(source, true)
  --   --     end,
  --   --   },
  --   -- },
  --
  --   -- default window options
  --   window = {
  --     layout = 'vertical',    -- 'vertical', 'horizontal', 'float', 'replace'
  --     width = 0.5,            -- fractional width of parent, or absolute width in columns when > 1
  --     height = 0.5,           -- fractional height of parent, or absolute height in rows when > 1
  --     -- Options below only apply to floating windows
  --     relative = 'editor',    -- 'editor', 'win', 'cursor', 'mouse'
  --     border = 'single',      -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
  --     row = nil,              -- row position of the window, default is centered
  --     col = nil,              -- column position of the window, default is centered
  --     title = 'Copilot Chat', -- title of chat window
  --     footer = nil,           -- footer of chat window
  --     zindex = 1,             -- determines if window is on top or below other floating windows
  --   },
  --
  --   -- default mappings
  --   mappings = {
  --     complete = {
  --       detail = 'Use @<Tab> or /<Tab> for options.',
  --       insert = '<Tab>',
  --     },
  --     close = {
  --       normal = 'q',
  --       insert = '<C-c>'
  --     },
  --     reset = {
  --       normal = '<C-l>',
  --       insert = '<C-l>'
  --     },
  --     submit_prompt = {
  --       normal = '<CR>',
  --       insert = '<C-s>'
  --     },
  --     accept_diff = {
  --       normal = '<C-y>',
  --       insert = '<C-y>'
  --     },
  --     yank_diff = {
  --       normal = 'gy',
  --       register = '"',
  --     },
  --     show_diff = {
  --       normal = 'gd'
  --     },
  --     show_info = {
  --       normal = 'gp'
  --     },
  --     show_context = {
  --       normal = 'gs'
  --     },
  --   },
  -- },
}
