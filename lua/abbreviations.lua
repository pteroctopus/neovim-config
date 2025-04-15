-- [[ Abbreviations]]

-- Set filetypes in command mode
vim.cmd("cabbrev sjs set filetype=javascript")
vim.cmd("cabbrev syaml set filetype=yaml")
vim.cmd("cabbrev sya set filetype=yaml.ansible")
vim.cmd("cabbrev shtml set filetype=html")
vim.cmd("cabbrev sxml set filetype=xml")
vim.cmd("cabbrev ssql set filetype=sql")
vim.cmd("cabbrev sjava set filetype=java")
vim.cmd("cabbrev sldif set filetype=ldif")
vim.cmd("cabbrev smd set filetype=markdown")
vim.cmd("cabbrev sjson set filetype=json")

-- Copy file path of current buffer to system clipboard
vim.cmd('cabbrev cpath let @+ = expand("%:p")')
vim.cmd('cabbrev cdir let @+ = expand("%:p:h")')
