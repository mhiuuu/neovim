local map = vim.keymap.set

-- ╭──────────────────────────────╮
-- │ Insert Mode Navigation Keys │
-- ╰──────────────────────────────╯
map("i", "<C-b>", "<ESC>^i", { desc = "Move to beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
map("i", "<C-Right>", "<C-o>w", { desc = "Move forward one word" })
map("i", "<C-Left>", "<C-o>b", { desc = "Move backward one word" })

-- ╭────────────────────────────╮
-- │ Window Navigation (Normal) │
-- ╰────────────────────────────╯
map("n", "<C-h>", "<C-w>h", { desc = "Switch to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch to below window" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch to above window" })

-- ╭──────────────────────────────╮
-- │ General Editor Shortcuts     │
-- ╰──────────────────────────────╯
map({ "n", "v", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map({ "n", "v", "i" }, "<C-q>", "<cmd>q!<CR>", { desc = "Force quit file" })
map({ "n", "v", "i" }, "<C-z>", "<cmd>u<CR>", { desc = "Undo changes" })
map({ "n", "v" }, "<C-a>", "ggVG", { desc = "Select all" })
map("v", "<C-c>", "y", { desc = "Copy to system clipboard" })

-- ╭──────────────╮
-- │ File Format  │
-- ╰──────────────╯
map("n", "<leader>fm", function()
    require("conform").format({ lsp_fallback = true })
end, { desc = "Format current file" })

-- ╭────────────────────────────────────╮
-- │ Split Window Management (Normal)   │
-- ╰────────────────────────────────────╯
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize split sizes" })
map("n", "<leader>sc", ":close<CR>", { desc = "Close current split" })

-- ╭────────────────────────────╮
-- │ Buffer Management          │
-- ╰────────────────────────────╯
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Open new buffer" })
map("n", "<A-tab>", function()
    require("nvchad.tabufline").next()
end, { desc = "Next buffer" })
map("n", "<S-tab>", function()
    require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })
map("n", "<leader>q", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

-- ╭────────────────────╮
-- │ Comment Toggling   │
-- ╰────────────────────╯
map("n", "<C-/>", "gcc", { desc = "Toggle comment (normal)", remap = true })
map("v", "<C-/>", "gc", { desc = "Toggle comment (visual)", remap = true })

-- ╭────────────────────╮
-- │ NvimTree Shortcuts │
-- ╰────────────────────╯
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })

-- ╭────────────────────────────╮
-- │ Telescope Search Shortcuts │
-- ╰────────────────────────────╯
map(
    "n",
    "<leader>ff",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "Find files (all)" }
)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find open buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help pages" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
map("n", "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Pick hidden terminal" })

-- ╭──────────────╮
-- │ LSP & Tools  │
-- ╰──────────────╯
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "Show diagnostics in loclist" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Open NvCheatsheet" })
map("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "Show all keymaps" })

map("n", "<leader>th", function()
    require("nvchad.themes").open()
end, { desc = "Open NvChad themes" })

-- ╭────────────────────────────╮
-- │ Terminal Shortcuts         │
-- ╰────────────────────────────╯
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Exit terminal mode" })
map("n", "<leader>h", function()
    require("nvchad.term").new({ pos = "sp" })
end, { desc = "New horizontal terminal" })
map("n", "<leader>v", function()
    require("nvchad.term").new({ pos = "vsp" })
end, { desc = "New vertical terminal" })

-- Toggleable terminals
map({ "n", "t" }, "<A-v>", function()
    require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "Toggle vertical terminal" })

map({ "n", "t" }, "<A-h>", function()
    require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "Toggle horizontal terminal" })

map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Toggle floating terminal" })

-- ╭──────────────────────────────╮
-- │ Custom Menu Integration     │
-- ╰──────────────────────────────╯
map("n", "<C-t>", function()
    require("menu").open("default")
end, { desc = "Open default menu" })

map({ "n", "i", "v" }, "<RightMouse>", function()
    local options = vim.bo.filetype == "NvimTree" and "nvimtree" or "default"
    require("menu").open(options, { mouse = true })
end, { desc = "Contextual right-click menu" })
