local map = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line during insert" })
map("i", "<C-e>", "<End>", { desc = "move end of line during insert" })
map("i", "<C-h>", "<Left>", { desc = "move left during insert" })
map("i", "<C-l>", "<Right>", { desc = "move right during insert" })
map("i", "<C-j>", "<Down>", { desc = "move down during insert" })
map("i", "<C-k>", "<Up>", { desc = "move up during insert" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map({ "n", "v", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map({ "n", "v", "i" }, "<C-q>", "<cmd>q!<CR>", { desc = "general quit file" })
map({ "n", "v", "i" }, "<C-z>", "<cmd>u<CR>", { desc = "general undo changes" })
map({ "n", "v", "i" }, "<C-a>", "ggVG", { desc = "general select all" })
map({ "n", "v", "i" }, "<C-v>", "+p", { desc = "general paste from system clipboard" })
map("n", "vfl", "^vg_", { desc = "general visual select entire line" })
map("v", "<C-c>", "y", { desc = "general copy" })
map("n", "d", '"_d', { noremap = true })
map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

-- Split windows
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Split Make windows equal size" })
map("n", "<leader>sc", ":close<CR>", { desc = "Split Close current split window" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
	require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
	require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<C-/>", "gcc", { desc = "toggle comment", remap = true })
map("v", "<C-/>", "gc", { desc = "toggle comment", remap = true })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>th", function()
	require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map(
	"n",
	"<leader>ff",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

map("n", "<leader>h", function()
	require("nvchad.term").new({ pos = "sp" })
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
	require("nvchad.term").new({ pos = "vsp" })
end, { desc = "terminal new vertical term" })

map("n", ":", "<cmd>FineCmdline<CR>", { desc = "terminal open quick float term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
	require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
	require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })
