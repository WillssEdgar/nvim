-- Set the leader key to space
vim.g.mapleader = " "

-- For conciseness
local keymap = vim.keymap

-- Exit insert mode quickly with 'jk'
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sb", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize split dimensions" })
keymap.set("n", "<leader>sm", "<C-w>|", { desc = "Maximize current window" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tmux-like directional window resizing
keymap.set("n", "<leader>sk", "<cmd>lua require('willsedgar.core.utils').resize(false, -10)<CR>", {
	silent = true,
	desc = "Increase horizontal split",
})
keymap.set("n", "<leader>sj", "<cmd>lua require('willsedgar.core.utils').resize(false, 10)<CR>", {
	silent = true,
	desc = "Decrease horizontal split",
})
keymap.set("n", "<leader>sh", "<cmd>lua require('willsedgar.core.utils').resize(true, -10)<CR>", {
	silent = true,
	desc = "Decrease vertical split",
})
keymap.set("n", "<leader>sl", "<cmd>lua require('willsedgar.core.utils').resize(true, 10)<CR>", {
	silent = true,
	desc = "Increase vertical split",
})

-- Keep visual selection when indenting
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Toggle color column at 81
keymap.set("n", "<leader>|", function()
	vim.opt.colorcolumn = (#vim.opt.colorcolumn:get() > 0) and {} or { "81" }
end, { silent = true, desc = "Toggle color column" })

-- Move selected lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Join lines without moving the cursor
keymap.set("n", "J", "mzJ`z", { desc = "Join line below without moving cursor" })

-- Make the current file executable
keymap.set("n", "<leader>xc", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Scroll with centering
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Search with centering
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Toggle wrapping and formatting of long lines
keymap.set("n", "<leader>lf", ":setlocal wrap! linebreak! breakindent!<CR>", {
	silent = true,
	desc = "Toggle line wrapping and formatting",
})

-- Copy file path / filepath to the clipboard
keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "[P]Copy file path to clipboard" })


keymap.set("n", "<leader>fn", function()
	local fileName = vim.fn.expand("%:t")
	vim.fn.setreg("+", fileName)
	print("File name copied to clipboard: " .. fileName)
end, { desc = "[P]Copy file name to clipboard" })

-- last file
keymap.set('n', '<leader><Tab>', '<C-^>', { noremap = true, silent = true })

-- surround
keymap.set('v', '"', 'c""<esc>P')
keymap.set('v', '[', 'c[]<esc>P')
keymap.set('v', '{', 'c{}<esc>P')
keymap.set('v', '(', 'c()<esc>P')
keymap.set('v', "'", "c''<esc>P")
keymap.set('v', '`', 'c``<esc>P')

keymap.set('n', '<leader>so', ':so %<CR>')
