-- Enable treesitter highlighting for filetypes with parsers
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

