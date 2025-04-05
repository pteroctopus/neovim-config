-- Automatic resize of splits on window size change
local vimresized_group = vim.api.nvim_create_augroup("VimresizedGroup", { clear = true })

vim.api.nvim_create_autocmd("VimResized", {
  group = vimresized_group,
  pattern = "*",
  command = "wincmd =",
  desc = "Automatically resize windows when the host window size changes.",
})
