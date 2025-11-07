-- [[ Oil functions ]]
local oil_toggle = function(path)
  if vim.bo.filetype == "oil" then
    require("oil").close()
  else
    if path then
      require("oil").open(path)
    else
      require("oil").open()
    end
  end
end

-- Oil open path in current directory of the buffer
local oil_toggle_curr_buf_path = function()
  oil_toggle()
end

-- Oil open path in current working directory
local oil_toggle_cwd = function()
  oil_toggle(".")
end

vim.keymap.set("n", "<leader>o", oil_toggle_curr_buf_path, { desc = "[O] Oil current buffer path" })
vim.keymap.set("n", "<leader>O", oil_toggle_cwd, { desc = "[O] Oil cwd path" })

return {
  enabled = true,
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    columns = {
      -- 'permissions',
      -- 'mtime',
      -- "size",
      -- "icon",
    },
  },
  -- Optional dependencies
  dependencies = {
    "echasnovski/mini.icons",
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
