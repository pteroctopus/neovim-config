local save_quickfix_to_file = function()
  local file_path = ".qf"
  -- Get the current quickfix list
  local qf_list = vim.fn.getqflist()

  -- Open the file for writing
  local file = io.open(file_path, "w")
  if not file then
    print("Error: Could not open file " .. file_path)
    return
  end

  -- Write each quickfix entry to the file in a valid format
  for _, entry in ipairs(qf_list) do
    if entry.valid == 1 then
      local line = string.format("%s:%d:%d:%s\n", vim.fn.bufname(entry.bufnr), entry.lnum, entry.col, entry.text)
      file:write(line)
    end
  end

  -- Close the file
  file:close()
  print("Quickfix list saved to " .. file_path)
end

return {

  basic = function()
    -- [[ Basic Keymaps ]]
    -- See `:help vim.keymap.set()`
    vim.keymap.set(
      { "n", "v" },
      "<Space>",
      "<Nop>",
      { silent = true, desc = "[B] Disable space in normal and visual modes" }
    )
    -- Show full name and buffer of currently open file instead of short name
    vim.keymap.set("n", "<C-g>", "2<C-g>")
    -- Execute macro in register q from next line to the end of the file
    vim.keymap.set(
      "n",
      "<leader>q",
      ":.+1,$normal @q<cr>",
      { silent = true, desc = "[B] Execute macro on rest of the lines. (.+1,$)" }
    )
    -- Tab list and nolist
    vim.keymap.set("n", "<leader>1", ":set list!<cr>", { silent = true, desc = "[B] Toggle hidden characters" })
    -- Buffer navigation
    vim.keymap.set("n", "<C-n>", ":bnext<cr>", { silent = true, desc = "[B] Next buffer" })
    vim.keymap.set("n", "<C-p>", ":bprevious<cr>", { silent = true, desc = "[B] Previous buffer" })
    -- Remap Enter to also remove search highlight
    vim.keymap.set("n", "<cr>", ":noh<cr><cr>", { silent = true })
    -- Remap Esc to also remove search highlight
    vim.keymap.set("n", "<esc>", ":noh<esc>", { silent = true })

    -- Diagnostic keymaps
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "[B] Previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "[B] Next diagnostic" })
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "[B] Open diagnostics floating window" })
    vim.keymap.set("n", "<leader>w", vim.diagnostic.setloclist, { desc = "[B] Open diagnostics buffer" })

    -- Quickfix keymaps
    -- Open quickfix list
    vim.keymap.set("n", "<leader>co", ":copen<cr>", { silent = true, desc = "[B] Open quickfix list" })
    -- Close quickfix list
    vim.keymap.set("n", "<leader>cq", ":cclose<cr>", { silent = true, desc = "[B] Close quickfix list" })
    -- Add current line to quickfix list
    vim.keymap.set(
      "n",
      "<leader>ca",
      ':caddexpr expand("%") .. ":" .. line(".") ..  ":" .. getline(".")<cr>',
      { silent = true, desc = "[B] Add current line to quickfix list" }
    )
    -- Clear quickfix list
    vim.keymap.set("n", "<leader>cc", ":cexpr []<cr>", { silent = true, desc = "[B] Clear quickfix list" })
    -- Save/Load quickfix list to file
    vim.keymap.set(
      "n",
      "<leader>cs",
      save_quickfix_to_file,
      { noremap = true, silent = true, desc = "[B] Save quickfix list to file" }
    )
    vim.keymap.set("n", "<leader>cL", ":cfile .qf<cr>", { silent = true, desc = "[B] Load quickfix list from file" })
    -- Quickfix list navigation
    vim.keymap.set("n", "<leader>cn", ":cnext<cr>", { silent = true, desc = "[B] Next item in quickfix list" })
    vim.keymap.set("n", "<leader>cp", ":cprevious<cr>", { silent = true, desc = "[B] Previous item in quickfix list" })
    vim.keymap.set("n", "<leader>cf", ":cfirst<cr>", { silent = true, desc = "[B] First item in quickfix list" })
    vim.keymap.set("n", "<leader>cl", ":clast<cr>", { silent = true, desc = "[B] Last item in quickfix list" })
  end,
}
