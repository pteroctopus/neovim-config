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
map("n", "<leader>q", ":.+1,$normal @q<cr>",
  { silent = true, desc = "[B] Execute @q on (.+1,$)" })

-- Toggle hidden characters (set list!)
map("n", "<leader>1", ":set list!<cr>",
  { silent = true, desc = "[B] Toggle hidden chars" })

-- ============================================================================
-- Buffer / search
-- ============================================================================

map("n", "<C-n>", ":bnext<cr>",     { silent = true, desc = "[B] Next buffer" })
map("n", "<C-p>", ":bprevious<cr>", { silent = true, desc = "[B] Previous buffer" })

-- <CR> / <Esc> also clear search highlight
map("n", "<cr>",  ":noh<cr><cr>", { silent = true })
map("n", "<esc>", ":noh<esc>",   { silent = true })

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

map("n", "<leader>co", ":copen<cr>",  { silent = true, desc = "[B] Open quickfix list" })
map("n", "<leader>cq", ":cclose<cr>", { silent = true, desc = "[B] Close quickfix list" })
map("n", "<leader>ca",
  ':caddexpr expand("%") .. ":" .. line(".") ..  ":" .. getline(".")<cr>',
  { silent = true, desc = "[B] Add current line to qf" })
map("n", "<leader>cc", ":cexpr []<cr>", { silent = true, desc = "[B] Clear qf list" })
map("n", "<leader>cs", save_quickfix_to_file,
  { noremap = true, silent = true, desc = "[B] Save qf list to file" })
map("n", "<leader>cL", ":cfile .qf<cr>",
  { silent = true, desc = "[B] Load qf list from file" })

-- Quickfix navigation
map("n", "<leader>cn", ":cnext<cr>",     { silent = true, desc = "[B] Next qf item" })
map("n", "<leader>cp", ":cprevious<cr>", { silent = true, desc = "[B] Previous qf item" })
map("n", "<leader>cf", ":cfirst<cr>",    { silent = true, desc = "[B] First qf item" })
map("n", "<leader>cl", ":clast<cr>",     { silent = true, desc = "[B] Last qf item" })

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

-- In line: end of line back to first non-blank
map({ "o", "v" }, "il", ":<c-u>normal! $v^<cr>",
  { silent = true, noremap = true, desc = "[TO] In line" })

-- Around line: full line including leading whitespace
map({ "o", "v" }, "al", ":<c-u>normal! $v0<cr>",
  { silent = true, noremap = true, desc = "[TO] Around line" })
