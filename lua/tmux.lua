local function get_var_name()
  -- only run inside tmux
  local tmux_pane = os.getenv("TMUX_PANE")
  if not tmux_pane then return end

  -- query tmux for session, window, pane
  local session = vim.fn.system("tmux display-message -p -t " .. tmux_pane .. " '#{session_name}'"):gsub("%s+$", "")
  local window  = vim.fn.system("tmux display-message -p -t " .. tmux_pane .. " '#{window_index}'"):gsub("%s+$", "")
  local pane_index = vim.fn.system("tmux display-message -p -t " .. tmux_pane .. " '#{pane_index}'"):gsub("%s+$", "")

  -- pane-specific global variable name
  local var_name = string.format("NVIM_CURRENT_FILE_%s_%s_%s", session, window, pane_index)

  return var_name
end


-- Neovim Lua: set pane-specific NVIM_CURRENT_FILE in tmux
local function set_tmux_current_file()
  -- current buffer full path
  local fname = vim.fn.expand('%:p')

  -- pane-specific global variable name
  local var_name = get_var_name()
  -- if not inside tmux, exit
  if not var_name then return end

  -- set global tmux env variable
  vim.fn.system(string.format(
    "tmux set-environment -g %s %s >/dev/null 2>&1",
    var_name,
    vim.fn.shellescape(fname)
  ))
end

local function unset_tmux_current_file()
  -- pane-specific global variable name
  local var_name = get_var_name()
  -- if not inside tmux, exit
  if not var_name then return end

  -- unset global tmux env variable
  vim.fn.system(string.format(
    "tmux set-environment -gu %s >/dev/null 2>&1",
    var_name
  ))
end

local augroup_id = vim.api.nvim_create_augroup("TmuxCurrentFile", { clear = true })

-- autocommands: update on buffer/window enter, also on Vim exit
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  callback = set_tmux_current_file,
  desc = "Set global pane-specific NVIM_CURRENT_FILE in tmux",
  group = augroup_id,
})

vim.api.nvim_create_autocmd({"VimLeavePre"},{
  callback = unset_tmux_current_file,
  desc = "Unset global pane-specific NVIM_CURRENT_FILE in tmux",
  group = augroup_id,
})
