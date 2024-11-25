-- Enable line numbers and keep the sign column always visible
vim.wo.number = true
vim.wo.signcolumn = "yes"

-- General settings for usability
vim.o.relativenumber = true -- Use relative line numbers
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim
vim.o.mouse = "a" -- Enable mouse support
vim.o.wrap = true -- Wrap long lines
vim.o.linebreak = true -- Break lines at words, not mid-word
vim.o.scrolloff = 4 -- Keep 4 lines visible above/below the cursor
vim.o.sidescrolloff = 8 -- Keep 8 columns visible on the sides
vim.o.cursorline = true -- Highlight the current line
vim.o.laststatus = 3 -- Set laststatus into mode 3 for the status bar

-- Tab and indentation settings
vim.o.shiftwidth = 4 -- Indent by 4 spaces
vim.o.tabstop = 4 -- A tab equals 4 spaces
vim.o.softtabstop = 4 -- Tab key inserts/removes 4 spaces
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.autoindent = true -- Copy indent from the current line
vim.o.smartindent = true -- Automatically adjust indentation

-- Search settings
vim.o.ignorecase = true -- Ignore case when searching
vim.o.smartcase = true -- Case-sensitive search if query contains uppercase
vim.o.hlsearch = false -- Disable search highlight

-- Split window behavior
vim.o.splitbelow = true -- Horizontal splits open below
vim.o.splitright = true -- Vertical splits open to the right

-- Visual and UI settings
vim.o.termguicolors = true -- Enable true color support
vim.o.numberwidth = 4 -- Set width of line number column
vim.o.cmdheight = 0 -- Minimal command-line height
vim.o.showtabline = 2 -- Always show the tab bar

-- Performance optimizations
vim.o.updatetime = 250 -- Faster completion (default: 4000ms)
vim.o.timeoutlen = 300 -- Shorter keymap sequence timeout

-- File handling and backups
vim.o.undofile = true -- Enable persistent undo
vim.o.swapfile = false -- Disable swap files
vim.o.backup = false -- Disable file backups
vim.o.writebackup = false -- Prevent editing files open elsewhere

-- Popup menu
vim.o.pumheight = 10 -- Limit popup menu height
vim.o.completeopt = "menuone,noselect" -- Better completion experience
vim.opt.shortmess:append("c") -- Suppress completion messages

-- Formatting options
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Prevent auto-inserting comment leaders
vim.opt.iskeyword:append("-") -- Treat hyphenated words as a single word

-- Cursor behavior
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20" -- Use block cursor in normal mode
