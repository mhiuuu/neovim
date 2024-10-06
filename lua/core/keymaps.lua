vim.g.mapleader = " "
vim.g.maplocalleader = " "
map = vim.keymap.set

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Geenral keybinds
map({ "n", "v", "i" }, "<C-s>", "<cmd> w <CR>", { desc = "Command Save file" })
map({ "n", "v", "i" }, "<C-q>", "<cmd> q <CR>", { desc = "Command Quit file" })
map({ "n", "v", "i" }, "<C-p>", '"_dP', { desc = "Command Paste without overwriting register" })
map({ "n", "v", "i" }, "<C-x>", '"_x', { desc = "Command Delete without yanking" })
map({ "n", "v", "i" }, "<C-z>", "<cmd> u <CR>", { desc = "Command Undo changes" })
map({ "n", "v", "i" }, "<C-r>", "<cmd> red <CR>", { desc = "Command Redo changes" })
map({ "n", "v", "i" }, "<C-a>", "ggVG", { desc = "Command Select all" })
map({ "n", "v", "i" }, "<C-v>", "+p", { desc = "Command Paste from system clipboard" })
map("v", "<C-c>", "y", { desc = "Command Copy" })
map("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Command Toggle line wrapping" })

-- Resize windows with arrows
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Resize window up" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Resize window down" })
map("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Resize window left" })
map("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Resize window right" })

-- Buffer navigation
map("n", "<Tab>", ":bnext<CR>", { desc = "Buffer Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Buffer Previous buffer" })
map("n", "<C-d>", ":Bdelete!<CR>", { desc = "Buffer Close buffer" })
map("n", "<C-b>", "<cmd> enew <CR>", { desc = "Buffer New buffer" })

-- Window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Split Make windows equal size" })
map("n", "<leader>sc", ":close<CR>", { desc = "Split Close current split window" })

-- Navigate between splits
map("n", "<C-k>", ":wincmd k<CR>", { desc = "Move to upper split" })
map("n", "<C-j>", ":wincmd j<CR>", { desc = "Move to lower split" })
map("n", "<C-h>", ":wincmd h<CR>", { desc = "Move to left split" })
map("n", "<C-l>", ":wincmd l<CR>", { desc = "Move to right split" })

-- Tabs
map("n", "<leader>to", ":tabnew<CR>", { desc = "Tab Open new tab" })
map("n", "<leader>tx", ":tabclose<CR>", { desc = "Tab Close current tab" })
map("n", "<leader>tn", ":tabn<CR>", { desc = "Tab Go to next tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "Tab Go to previous tab" })

--Telescope
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope find in current buffer" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" }
)


-- Cmd line
map("n", ":", "<cmd>FineCmdline<CR>", { desc = "Terminal Open quick float term" })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal escape terminal mode" })


map("n", "<leader>th", function()
    require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })


-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
    require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
    require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
    require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
    require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })


map('n', 'd', '"_d', { noremap = true })
