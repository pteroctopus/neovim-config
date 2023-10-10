-- [[ Oil functions ]]
local oil_toggle = function (path)
  if vim.bo.filetype == 'oil' then
    -- Close current oil buffer
    vim.api.nvim_buf_delete(vim.api.nvim_get_current_buf(), { force = true })
  else
    -- Open oil buffer
    require('oil').open(path)
  end
end

-- Oil open path in current directory of the buffer
local oil_toggle_curr_buf_path = function ()
  oil_toggle(vim.fn.expand('%:h'))
end

-- Oil open path in current working directory
local oil_toggle_cwd = function ()
  oil_toggle('.')
end


return {

  basic = function ()
    -- [[ Basic Keymaps ]]
    -- See `:help vim.keymap.set()`
    vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = '[B] Disable space in normal and visual modes' })
    -- Replace : and ;
    vim.keymap.set('n', ';', ':')
    vim.keymap.set('n', ':', ';')
    -- Show full name and buffer of currently open file instead of short name
    vim.keymap.set('n', '<C-g>', '2<C-g>')
    -- Relative or absolute numbering settings
    vim.keymap.set('n', '<leader>nu', function()
      vim.o.relativenumber = not vim.o.relativenumber
    end, { desc = '[B] Toggle relativenumber' })
    -- Execute macro in register q from next line to the end of the file
    vim.keymap.set('n', '<leader>q', ':.+1,$normal @q<cr>', { desc = '[B] Execute macro on rest of the lines. (.+1,$)'})
    -- Tab list and nolist
    vim.keymap.set('n', '<leader>1', ':set list!<cr>', { desc = '[B] Toggle hidden characters'})
    -- Buffer navigation
    vim.keymap.set('n', '<leader>l', ':bnext<cr>', { desc = '[B] Next buffer' })
    vim.keymap.set('n', '<leader>h', ':bprevious<cr>', { desc = '[B] Previous buffer' })
    vim.keymap.set('n', '<leader>b', ':ls<cr>:buffer', { desc = '[B] List buffers' })
    -- Search highlight off
    vim.keymap.set('n', '<leader>n', ':noh<cr>', { desc = '[B] Search highlight off' })
    -- Remap Enter to also remove search highlight
    vim.keymap.set('n', '<cr>', ':noh<cr><cr>')
    -- Remap Esc to also remove search highlight
    vim.keymap.set('n', '<esc>', ':noh<esc>', { silent = true })
    -- Remap for dealing with word wrap
    --vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    --vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

    -- Format code
    vim.keymap.set(
      'n', '<leader>f',
      function()
        if vim.bo.filetype == 'markdown' then
          vim.bo.textwidth = 80
          vim.o.colorcolumn = "80"
          vim.api.nvim_command(':w')
          vim.api.nvim_command(':silent !deno fmt %')
          print('Deno format complete')
        else
          vim.api.nvim_command(':Format')
        end
      end,
      { desc = '[B] Format buffer with external tool of language server' }
    )

    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = '[B] Previous diagnostic'})
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = '[B] Next diagnostic'})
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = '[B] Open diagnostics floating window'})
    vim.keymap.set('n', '<leader>w', vim.diagnostic.setloclist, { desc = '[B] Open diagnostics buffer'})
  end,

  telescope = function()
    -- See `:help telescope.builtin`
    return {
      { '<localleader>?', require('telescope.builtin').oldfiles, mode = 'n', desc = '[T] Find recently opened files' },
      { '<localleader><space>', require('telescope.builtin').buffers, mode = 'n', desc = '[T] Find existing buffers' },
      { '<localleader>gf', require('telescope.builtin').git_files, mode = 'n', desc = '[T] Search Git Files' },
      { '<localleader>sf', require('telescope.builtin').find_files, mode = 'n', desc = '[T] Search Files' },
      { '<localleader>sh', require('telescope.builtin').help_tags, mode = 'n', desc = '[T] Search Help' },
      { '<localleader>sw', require('telescope.builtin').grep_string, mode = 'n', desc = '[T] Search current Word' },
      { '<localleader>sg', require('telescope.builtin').live_grep, mode = 'n', desc = '[T] Search by Grep' },
      { '<localleader>sd', require('telescope.builtin').diagnostics, mode = 'n', desc = '[T] Search Diagnostics' },
      { '<localleader>sr', require('telescope.builtin').resume, mode = 'n', desc = '[T] Resume Picker' },
      { '<localleader>sk', require('telescope.builtin').keymaps, mode = 'n', desc = '[T] Search keymaps' },
      { '<localleader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, mode = 'n', desc = '[T] Fuzzily search in current buffer]'
      },
    }
  end,

  nvim_tree = function()
    return {
      { '<localleader>n', ':NvimTreeFindFileToggle<cr>', mode = 'n', { desc = '[TR] Toggle nvim-tree and focus on current file' } },
    }
  end,

  oil = function ()
    vim.keymap.set('n', '<localleader>o', oil_toggle_curr_buf_path, { desc = '[O] Oil current buffer path' })
    vim.keymap.set('n', '<localleader>O', oil_toggle_cwd, { desc = '[O] Oil cwd path' })
  end,

  nvim_dap_ui = function (dapui)
    return {
      { "<localleader>du", function() dapui.toggle({}) end, desc = "[D] Dap UI" },
      { "<localleader>de", function() dapui.eval() end,     desc = "[D] Eval",  mode = { "n", "v" } },
    }
  end,

  nvim_dap = function (dap, dap_ui_widgets)
    return {
      { "<localleader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "[D] Breakpoint Condition" },
      { "<localleader>db", function() dap.toggle_breakpoint() end, desc = "[D] Toggle Breakpoint" },
      { "<localleader>dc", function() dap.continue() end, desc = "[D] Continue" },
      { "<localleader>dC", function() dap.run_to_cursor() end, desc = "[D] Run to Cursor" },
      { "<localleader>dg", function() dap.goto_() end, desc = "[D] Go to line (no execute)" },
      { "<localleader>di", function() dap.step_into() end, desc = "[D] Step Into" },
      { "<localleader>dj", function() dap.down() end, desc = "[D] Down" },
      { "<localleader>dk", function() dap.up() end, desc = "[D] Up" },
      { "<localleader>dl", function() dap.run_last() end, desc = "[D] Run Last" },
      { "<localleader>dO", function() dap.step_out() end, desc = "[D] Step Out" },
      { "<localleader>do", function() dap.step_over() end, desc = "[D] Step Over" },
      { "<localleader>dp", function() dap.pause() end, desc = "[D] Pause" },
      { "<localleader>dr", function() dap.repl.toggle() end, desc = "[D] Toggle REPL" },
      { "<localleader>ds", function() dap.session() end, desc = "[D] Session" },
      { "<localleader>dt", function() dap.terminate() end, desc = "[D] Terminate" },
      { "<localleader>dw", function() dap_ui_widgets.hover() end, desc = "[D] Widgets" },
    }
  end,

  language_servers = function(bufnr)
    vim.keymap.set('n', '<localleader>lr', vim.lsp.buf.rename, { buffer = bufnr, desc = '[L] Rename' })
    vim.keymap.set('n', '<localleader>la', vim.lsp.buf.code_action, { buffer = bufnr, desc = '[L] Code Action' })

    vim.keymap.set('n', '<localleader>ld', vim.lsp.buf.definition, { buffer = bufnr, desc = '[L] Goto Definition' })

    vim.keymap.set('n', '<localleader>lf', require('telescope.builtin').lsp_references, { buffer = bufnr, desc = '[L] Goto References' })
    vim.keymap.set('n', '<localleader>li', vim.lsp.buf.implementation, { buffer = bufnr, desc = '[L] Goto Implementation' })
    vim.keymap.set('n', '<localleader>lD', vim.lsp.buf.type_definition, { buffer = bufnr, desc = '[L] Type Definition' })
    vim.keymap.set('n', '<localleader>ls', require('telescope.builtin').lsp_document_symbols, { buffer = bufnr, desc = '[L] Document Symbols' })
    vim.keymap.set('n', '<localleader>lv', require('telescope.builtin').lsp_dynamic_workspace_symbols, { buffer = bufnr, desc = '[L] Workspace Symbols' })

    -- See `:help K` for why this keymap
    vim.keymap.set('n', '<localleader>lK', vim.lsp.buf.hover, { buffer = bufnr, desc = '[L] Hover Documentation' })
    vim.keymap.set('n', '<localleader>lS', vim.lsp.buf.signature_help, { buffer = bufnr, desc = '[L] Signature Documentation' })

    -- Lesser used LSP functionality
    vim.keymap.set('n', '<localleader>ll', vim.lsp.buf.declaration, { buffer = bufnr, desc = '[L] Goto Declaration' })
    vim.keymap.set('n', '<localleader>lwa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = '[L] Workspace Add Folder' })
    vim.keymap.set('n', '<localleader>lwr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = '[L] Workspace Remove Folder' })
    vim.keymap.set('n', '<localleader>lwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = bufnr, desc = '[L] Workspace List Folders' })
  end,

  nvim_navbuddy = function ()
    return {
      {'<localleader>b', ':Navbuddy<cr>', mode = 'n', desc = "[NB] Navbuddy" },
    }
  end,

  gitsigns = function (bufnr)
    vim.keymap.set('n', '<localleader>gp', require('gitsigns').prev_hunk,
      { buffer = bufnr, desc = '[GS] Go to Previous Hunk' })
    vim.keymap.set('n', '<localleader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[GS] Go to Next Hunk' })
    vim.keymap.set('n', '<localleader>gP', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[GS] Preview Hunk' })
    vim.keymap.set('n', '<localleader>gb', require('gitsigns').toggle_current_line_blame, { buffer = bufnr, desc = '[GS] Current line blame'})
  end,

}
