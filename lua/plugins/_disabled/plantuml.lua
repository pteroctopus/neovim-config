-- Set chromium to open browser directly because xdg-open doesn't work in this version 0.9.1 of neovim
vim.g.openbrowser_browser_commands = {
  {
    name = "chromium",
    args = { "{browser}", "{uri}" },
  },
}

-- TODO this needs to be set in lua
vim.cmd([[
let g:plantuml_previewer#viewer_path = '~/plantuml/viewer'
]])

return {
  "weirongxu/plantuml-previewer.vim",
  enabled = false,
  lazy = true,
  cmd = {
    "PlantumlOpen",
    "PlantumlSave",
    "PlantumlStart",
    "PlantumlStop",
    "PlantumlToggle",
  },
  dependencies = {
    "tyru/open-browser.vim",
    "aklt/plantuml-syntax",
  },
}
