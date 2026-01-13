-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Stop searching at the end of file
vim.o.wrapscan = false

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Search/Replace preview window
vim.o.inccommand = "split"

-- Set characters to used when ```set list``` is on
vim.o.listchars = "tab:-»,trail:·,extends:>,precedes:<,eol:$,space:·"

-- Disable welcome message
vim.o.shortmess = vim.o.shortmess .. "I"

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Set relative numbers
vim.o.relativenumber = true

-- Space instead of Tab
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Lines
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.colorcolumn = "120"

-- Tab and wrap settings
vim.o.breakindentopt = "shift:2"

-- Fold settings
vim.o.foldlevel = 10

-- Dialog instead of fail
vim.o.confirm = true

-- Disregard white space changes in diff
vim.opt.diffopt:append("iwhite")
