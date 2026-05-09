local oil_toggle = function(path)
  if vim.bo.filetype == "oil" then
    require("oil").close()
  elseif path then
    require("oil").open(path)
  else
    require("oil").open()
  end
end

return {
  "stevearc/oil.nvim",
  enabled = true,
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
  dependencies = {
    "nvim-mini/mini.icons",
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  keys = {
    { "<leader>o", function() oil_toggle() end,    desc = "[O] Oil current buffer path" },
    { "<leader>O", function() oil_toggle(".") end, desc = "[O] Oil cwd path" },
  },
}
