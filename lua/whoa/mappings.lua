local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Common
opts.desc = "Save without quit"
keymap("n", "<LEADER>w", "<CMD>confirm w<ENTER>", opts)

opts.desc = "Close buffer"
keymap("n", "<LEADER>q", "<CMD>bd<ENTER>", opts)

opts.desc = "Close window"
keymap("n", "Q", "<CMD>confirm q<CR>", opts)

opts.desc = "Make the current file executable"
keymap("n", "<LEADER>x", "<CMD>!chmod +x %<CR>", opts)

-- Tabs
opts.desc = "New tab"
keymap("n", "<LEADER>te", "<CMD>tabnew<CR>", opts)

opts.desc = "Next tab"
keymap("n", "<Tab>", "<CMD>tabnext<CR>", opts)

opts.desc = "Previous tab"
keymap("n", "<S-Tab>", "<CMD>tabprevious<CR>", opts)

-- Window navigation
opts.desc = "Move on left window"
keymap("n", "<C-h>", "<C-w>h", opts)

opts.desc = "Move on bottom window"
keymap("n", "<C-j>", "<C-w>j", opts)

opts.desc = "Move on up window"
keymap("n", "<C-k>", "<C-w>k", opts)

opts.desc = "Move on right window"
keymap("n", "<C-l>", "<C-w>l", opts)

-- Split screen
opts.desc = "Split horizontal screen"
keymap("n", "ss", "<CMD>split<CR>", opts)

opts.desc = "Split vertical screen"
keymap("n", "sv", "<CMD>vsplit<CR>", opts)

-- Resize with arrows
opts.desc = "Decrease height"
keymap("n", "<C-Up>", ":resize -2<CR>", opts)

opts.desc = "Increase height"
keymap("n", "<C-Down>", ":resize +2<CR>", opts)

opts.desc = "Decrease width"
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

opts.desc = "Increase width"
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
opts.desc = "Move text down"
keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)

opts.desc = "Move text up"
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- Exit in insert mode
opts.desc = "Exit insert mode"
keymap("i", "jk", "<ESC>", opts)

opts.desc = "Exit insert mode"
keymap("i", "kj", "<ESC>", opts)

-- Indent
opts.desc = "Indent line"
keymap("v", "<", "<gv^", opts)

opts.desc = "Unindent line"
keymap("v", ">", ">gv^", opts)

-- Plugins --

-- Lazy
opts.desc = "Open Lazy package manager"
keymap("n", "<LEADER>L", "<CMD>Lazy<CR>", opts)

-- Mason
opts.desc = "Mason home"
keymap("n", "<LEADER>pp", "<CMD>Mason<CR>", opts)

opts.desc = "Mason update"
keymap("n", "<LEADER>pM", "<CMD>MasonUpdate<CR>", opts)

-- Neo tree
opts.desc = "Open NeoTree"
keymap("n", "<LEADER>e", "<CMD>Neotree toggle<CR>", opts)

-- Icon picker
opts.desc = "Open icon picker"
keymap("n", "<LEADER>i", "<CMD>IconPickerNormal<CR>", opts)

opts.desc = "Yank icon"
keymap("n", "<LEADER>y", "<CMD>IconPickerYank<CR>", opts)

opts.desc = "Insert icon"
keymap("n", "<C-i>", "<CMD>IconPickerInsert<CR>", opts)

-- DBUI
opts.desc = "Open DBUI"
keymap("n", "<LEADER>du", "<CMD>DBUIToggle<CR>", opts)

opts.desc = "Add DBUI connection"
keymap("n", "<LEADER>da", "<CMD>DBUIAddConnection<CR>", opts)

-- Devdocs
opts.desc = "Open Devdocs"
keymap("n", "<LEADER>dd", "<CMD>DevdocsOpen<CR>", opts)

opts.desc = "Open Devdocs float"
keymap("n", "<LEADER>ds", "<CMD>DevdocsOpenCurrentFloat<CR>", opts)

-- Conform
opts.desc = "Conform info"
keymap("n", "<LEADER>ci", "<CMD>ConformInfo<CR>", opts)

-- Outline
opts.desc = "Open outline"
keymap("n", "<LEADER>o", "<CMD>Outline<CR>", opts)

-- Noice
opts.desc = "Show last message"
keymap("n", "gl", "<CMD>lua require('noice').cmd 'last'<CR>", opts)

opts.desc = "Show messages"
keymap("n", "gm", "<CMD>messages<CR>", opts)

-- Notify
opts.desc = "Dismiss notifications"
keymap("n", "<LEADER>nn", "<CMD>lua require('notify').dismiss()<CR>", opts)

opts.desc = "List notifications"
keymap("n", "<LEADER>nl", "<CMD>Notifications<CR>", opts)

-- Which key
opts.desc = "Open which key"
keymap("n", "<LEADER>?", "<CMD>WhichKey<CR>", opts)
