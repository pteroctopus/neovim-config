-- [[ Oil functions ]]
local oil_toggle = function (path)
  if vim.bo.filetype == 'oil' then
    require('oil').close()
  else
    if path then
      require('oil').open(path)
    else
      require('oil').open()
    end
  end
end

-- Oil open path in current directory of the buffer
local oil_toggle_curr_buf_path = function ()
  oil_toggle()
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
    vim.keymap.set({ 'n', 'v' }, ';', ':', { noremap = true })
    vim.keymap.set({ 'n', 'v' }, ':', ';', { noremap = true })
    -- Search next/previous and center
    -- vim.keymap.set('n', 'n', 'nzz', { silent = true, noremap = true })
    -- vim.keymap.set('n', '<S-n>', '<S-n>zz', { silent = true, noremap = true })
    -- Show full name and buffer of currently open file instead of short name
    vim.keymap.set('n', '<C-g>', '2<C-g>')
    -- Relative or absolute numbering settings
    vim.keymap.set('n', '<leader>nu', function() vim.o.relativenumber = not vim.o.relativenumber end, { desc = '[B] Toggle relativenumber' })
    -- Execute macro in register q from next line to the end of the file
    vim.keymap.set('n', '<leader>q', ':.+1,$normal @q<cr>', { silent = true, desc = '[B] Execute macro on rest of the lines. (.+1,$)'})
    -- Tab list and nolist
    vim.keymap.set('n', '<leader>1', ':set list!<cr>', { silent = true, desc = '[B] Toggle hidden characters'})
    -- Buffer navigation
    vim.keymap.set('n', '<leader>l', ':bnext<cr>', { silent = true, desc = '[B] Next buffer' })
    vim.keymap.set('n', '<leader>h', ':bprevious<cr>', { silent = true, desc = '[B] Previous buffer' })
    -- Remap Enter to also remove search highlight
    vim.keymap.set('n', '<cr>', ':noh<cr><cr>', { silent = true })
    -- Remap Esc to also remove search highlight
    vim.keymap.set('n', '<esc>', ':noh<esc>', { silent = true })
    -- Remap for dealing with word wrap
    --vim.keymap.set('n', 'k', 'v:count == 0 ? 'gk' : 'k'', { expr = true, silent = true })
    --vim.keymap.set('n', 'j', 'v:count == 0 ? 'gj' : 'j'', { expr = true, silent = true })

    -- Format code
    vim.keymap.set(
      'n', '<leader>f',
      function()
        if vim.bo.filetype == 'markdown' then
          vim.bo.textwidth = 80
          vim.o.colorcolumn = '80'
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
      { '<localleader>sq', require('telescope.builtin').quickfix, mode = 'n', desc = '[T] Search Quickfix list' },
      { '<localleader>sR', require('telescope.builtin').registers, mode = 'n', desc = '[T] Search Registers' },
      { '<localleader>sM', require('telescope.builtin').marks, mode = 'n', desc = '[T] Search Marks' },
      { '<localleader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, mode = 'n', desc = '[T] Fuzzily search in current buffer'
      },
    }
  end,

  nvim_tree = function()
    return {
      { '<localleader>n', ':NvimTreeFindFileToggle<cr>', mode = 'n', { silent = true, desc = '[TR] Toggle nvim-tree' } },
    }
  end,

  oil = function ()
    vim.keymap.set('n', '<localleader>o', oil_toggle_curr_buf_path, { desc = '[O] Oil current buffer path' })
    vim.keymap.set('n', '<localleader>O', oil_toggle_cwd, { desc = '[O] Oil cwd path' })
  end,

  nvim_dap_ui = function (dapui)
    return {
      { '<localleader>du', function() dapui.toggle({}) end, desc = '[D] Dap UI' },
      { '<localleader>de', function() dapui.eval() end,     desc = '[D] Eval',  mode = { 'n', 'v' } },
    }
  end,

  nvim_dap = function (dap, dap_ui_widgets)
    return {
      { '<localleader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = '[D] Breakpoint Condition' },
      { '<localleader>db', function() dap.toggle_breakpoint() end, desc = '[D] Toggle Breakpoint' },
      { '<localleader>dc', function() dap.continue() end, desc = '[D] Continue' },
      { '<localleader>dC', function() dap.run_to_cursor() end, desc = '[D] Run to Cursor' },
      { '<localleader>dg', function() dap.goto_() end, desc = '[D] Go to line (no execute)' },
      { '<localleader>di', function() dap.step_into() end, desc = '[D] Step Into' },
      { '<localleader>dj', function() dap.down() end, desc = '[D] Down' },
      { '<localleader>dk', function() dap.up() end, desc = '[D] Up' },
      { '<localleader>dl', function() dap.run_last() end, desc = '[D] Run Last' },
      { '<localleader>dO', function() dap.step_out() end, desc = '[D] Step Out' },
      { '<localleader>do', function() dap.step_over() end, desc = '[D] Step Over' },
      { '<localleader>dp', function() dap.pause() end, desc = '[D] Pause' },
      { '<localleader>dr', function() dap.repl.toggle() end, desc = '[D] Toggle REPL' },
      { '<localleader>ds', function() dap.session() end, desc = '[D] Session' },
      { '<localleader>dt', function() dap.terminate() end, desc = '[D] Terminate' },
      { '<localleader>dw', function() dap_ui_widgets.hover() end, desc = '[D] Widgets' },
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
    vim.keymap.set('n', '<localleader>lk', vim.lsp.buf.hover, { buffer = bufnr, desc = '[L] Hover Documentation' })
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
      {'<localleader>b', ':Navbuddy<cr>', mode = 'n', { silent = true, desc = '[NB] Navbuddy' } },
    }
  end,

  gitsigns = function (bufnr)
    vim.keymap.set('n', '<localleader>gp', require('gitsigns').prev_hunk,
      { buffer = bufnr, desc = '[GS] Go to Previous Hunk' })
    vim.keymap.set('n', '<localleader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[GS] Go to Next Hunk' })
    vim.keymap.set('n', '<localleader>gP', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[GS] Preview Hunk' })
    vim.keymap.set('n', '<localleader>gb', require('gitsigns').toggle_current_line_blame, { buffer = bufnr, desc = '[GS] Current line blame'})
  end,

  trouble_nvim = function ()
    vim.keymap.set('n', '<localleader>xx', function() require('trouble').toggle() end, { desc = '[TR] Toggle trouble' })
    vim.keymap.set('n', '<localleader>xw', function() require('trouble').toggle('workspace_diagnostics') end, { desc = '[TR] Workspace diagnostics' })
    vim.keymap.set('n', '<localleader>xd', function() require('trouble').toggle('document_diagnostics') end, { desc = '[TR] Document diagnostics' })
    vim.keymap.set('n', '<localleader>xq', function() require('trouble').toggle('quickfix') end, { desc = '[TR] Quickfix list' })
    vim.keymap.set('n', '<localleader>xl', function() require('trouble').toggle('loclist') end, { desc = '[TR] Location list' })
    vim.keymap.set('n', '<localleader>xr', function() require('trouble').toggle('lsp_references') end, { desc = '[TR] LSP references' })
  end,

  todo_comments = function ()
    vim.keymap.set('n', '<localleader>xc', ':TodoTrouble<cr>', { desc = '[TC] Toggle Todo comments', silent = true, })
  end,

  diffview = function ()
    vim.keymap.set('n', '<localleader>go', ':DiffviewOpen<cr>', { desc = '[DV] Diff View Open', silent = true })
    vim.keymap.set('n', '<localleader>gO', ':DiffviewOpen <c-r>+<cr><cr>', { desc = '[DV] Diff View Open with commit hash from " register', silent = true })
    vim.keymap.set('n', '<localleader>gh', ':DiffviewFileHistory<cr>', { desc = '[DV] Diff File History', silent = true })
    vim.keymap.set('n', '<localleader>gc', ':DiffviewClose<cr>', { desc = '[DV] Diff View Close', silent = true })
    vim.keymap.set( 'n', '<localleader>j', require('diffview.actions').select_next_entry, { desc = '[DV] Open diff for the next file' } )
    vim.keymap.set( 'n', '<localleader>k', require('diffview.actions').select_prev_entry, { desc = '[DV] Open diff for the previous file' } )
  end,

  context = function ()
    vim.keymap.set('n', '[e', function()
      require('treesitter-context').go_to_context()
    end, { silent = true, desc = '[TSC] Previous context element'  })
  end,

  illuminate = function()
    vim.keymap.set("n", "<localleader>ln", function() require("illuminate").goto_next_reference() end, { desc = '[I] Goto next reference' })
    vim.keymap.set("n", "<localleader>lp", function() require("illuminate").goto_prev_reference() end, { desc = '[I] Goto previous reference' })
  end,

  vimtablemode = function()
    vim.keymap.set("n", "<leader>tr", ':TableModeRealign<cr>', { desc = '[VTM] Format table' })
  end,
}
