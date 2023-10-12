require('keymaps').todo_comments()

return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    highlight = {
        pattern = [[.*<(KEYWORDS)\s*]],
    },
    search = {
        pattern = [[\b(KEYWORDS)\b]],
    },
  },
}
