-- Plugin configuration
return {
  'SmiteshP/nvim-navbuddy',
  lazy = true,
  event = 'LspAttach',
  dependencies = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim'
  },
  opts = {
    window = {
        border = "single",  -- "rounded", "double", "solid", "none"
                            -- or an array with eight chars building up the border in a clockwise fashion
                            -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
        size = "50%",       -- Or table format example: { height = "40%", width = "100%"}
        position = {row = "100%", col = "100%"},   -- Or table format example: { row = "100%", col = "0%"}
        scrolloff = nil,    -- scrolloff value within navbuddy window
        sections = {
            left = {
                size = "20%",
                border = nil, -- You can set border style for each section individually as well.
            },
            mid = {
                size = "40%",
                border = nil,
            },
            right = {
                -- No size option for right most section. It fills to
                -- remaining area.
                border = nil,
                preview = "leaf",  -- Right section can show previews too.
                                   -- Options: "leaf", "always" or "never"
            }
        },
    },
    lsp = {
      auto_attach = true,
      preference = nil,
    },
  },
  keys = {
      {'<leader>b', ':Navbuddy<cr>', desc = '[NB] Navbuddy' },
  },
}
