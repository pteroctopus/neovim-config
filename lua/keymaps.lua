-- Keymaps. Loaded once at startup via `require("keymaps")` in init.lua.

local map = vim.keymap.set

-- ============================================================================
-- Helpers
-- ============================================================================

local function save_quickfix_to_file()
  local file_path = ".qf"
  local qf_list = vim.fn.getqflist()
  local file = io.open(file_path, "w")
  if not file then
    print("Error: Could not open file " .. file_path)
    return
  end
  for _, entry in ipairs(qf_list) do
    if entry.valid == 1 then
      local line = string.format("%s:%d:%d:%s\n",
        vim.fn.bufname(entry.bufnr), entry.lnum, entry.col, entry.text)
      file:write(line)
    end
  end
  file:close()
  print("Quickfix list saved to " .. file_path)
end

-- ============================================================================
-- Basic
-- ============================================================================

-- Disable space in n/v (it's the leader)
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true, desc = "[B] Disable space in n/v" })

-- Show full file path / buffer number with <C-g>
map("n", "<C-g>", "2<C-g>")

-- Execute macro in register q from next line to end of file
map("n", "<leader>q", "<cmd>.+1,$normal @q<cr>",
  { desc = "[B] Execute @q on (.+1,$)" })

-- Toggle hidden characters (set list!)
map("n", "<leader>1", "<cmd>set list!<cr>",
  { desc = "[B] Toggle hidden chars" })

-- ============================================================================
-- Buffer / search
-- ============================================================================

map("n", "<C-n>", "<cmd>bnext<cr>",     { desc = "[B] Next buffer" })
map("n", "<C-p>", "<cmd>bprevious<cr>", { desc = "[B] Previous buffer" })

-- <CR> / <Esc> also clear search highlight. Special buffers (quickfix,
-- command-line window, ...) keep the default keys: `:noh` there would fail
-- with E11 in the cmdwin and shadow <CR> jumping to a quickfix entry.
map("n", "<cr>", function()
  if vim.bo.buftype ~= "" then
    return "<cr>"
  end
  return "<cmd>noh<cr><cr>"
end, { expr = true, silent = true, desc = "[B] <CR> (also clears search highlight)" })
map("n", "<esc>", function()
  if vim.bo.buftype ~= "" then
    return "<esc>"
  end
  return "<cmd>noh<cr>"
end, { expr = true, silent = true, desc = "[B] <Esc> (also clears search highlight)" })

-- ============================================================================
-- Diagnostics
-- ============================================================================

map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
  { desc = "[B] Previous diagnostic" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
  { desc = "[B] Next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "[B] Diagnostic float" })
map("n", "<leader>w", vim.diagnostic.setloclist, { desc = "[B] Diagnostics to loclist" })

-- TODO/FIXME comment search via Telescope grep
map("n", "<leader>xc", function()
  require("telescope.builtin").grep_string({
    search = [[\b(TODO|FIXME|HACK|BUG|XXX|NOTE)\b]],
    use_regex = true,
  })
end, { desc = "[B] Search TODO/FIXME comments" })

-- ============================================================================
-- Quickfix
-- ============================================================================

map("n", "<leader>co", "<cmd>copen<cr>",  { desc = "[B] Open quickfix list" })
map("n", "<leader>cq", "<cmd>cclose<cr>", { desc = "[B] Close quickfix list" })
map("n", "<leader>ca",
  '<cmd>caddexpr expand("%") .. ":" .. line(".") .. ":" .. getline(".")<cr>',
  { desc = "[B] Add current line to qf" })
map("n", "<leader>cc", "<cmd>cexpr []<cr>", { desc = "[B] Clear qf list" })
map("n", "<leader>cs", save_quickfix_to_file,
  { desc = "[B] Save qf list to file" })
map("n", "<leader>cL", "<cmd>cfile .qf<cr>",
  { desc = "[B] Load qf list from file" })

-- Quickfix navigation
map("n", "<leader>cn", "<cmd>cnext<cr>",     { desc = "[B] Next qf item" })
map("n", "<leader>cp", "<cmd>cprevious<cr>", { desc = "[B] Previous qf item" })
map("n", "<leader>cf", "<cmd>cfirst<cr>",    { desc = "[B] First qf item" })
map("n", "<leader>cl", "<cmd>clast<cr>",     { desc = "[B] Last qf item" })

-- ============================================================================
-- Misc
-- ============================================================================

-- Yank file:line:col of cursor position to system clipboard
map("n", "<leader>y", function()
  local rel_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
  local pos = string.format("%s:%d:%d", rel_path, vim.fn.line("."), vim.fn.col("."))
  vim.fn.setreg("+", pos)
  print(pos)
end, { desc = "[B] Yank file:line:col" })

-- ============================================================================
-- Text objects
-- ============================================================================

-- These stay `:<c-u>` on purpose: <cmd> would run while still in visual
-- mode, where `$v^` behaves differently (v toggles visual off mid-motion).

-- In line: end of line back to first non-blank
map({ "o", "v" }, "il", ":<c-u>normal! $v^<cr>",
  { silent = true, noremap = true, desc = "[TO] In line" })

-- Around line: full line including leading whitespace
map({ "o", "v" }, "al", ":<c-u>normal! $v0<cr>",
  { silent = true, noremap = true, desc = "[TO] Around line" })
