return {
  "saghen/blink.cmp",
  lazy = false, -- handles its own lazy loading
  version = "1.*", -- use prebuilt binary; no rust toolchain needed
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
  opts = {
    -- <CR> accepts, <C-n>/<C-p> navigate, <C-Space> opens docs, <C-e> hides
    keymap = { preset = "enter" },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      -- Don't preselect or auto-insert; <CR> falls through to newline unless
      -- the user explicitly picks an item with <C-n>/<C-p>.
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
      menu = {
        draw = {
          -- Adds a source_name column (lsp / buffer / path / snippets) so you
          -- always see who proposed a given item.
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
            { "source_name" },
          },
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "lazydev", "markdown" },
      providers = {
        -- Neovim Lua API + plugin type completions (only fires in lua/lua_ls buffers).
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        -- Markdown widget completions (callouts, checkboxes, etc.).
        markdown = {
          name = "RenderMarkdown",
          module = "render-markdown.integ.blink",
          fallbacks = { "lsp" },
        },
      },
    },
    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    -- Signature help popup when typing '(' or ',' (still experimental in blink 1.x).
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}
