vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keymaps

local function notify(cmd)
	return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end
local function v_notify(cmd)
	return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end
vim.keymap.set("n", "<Leader>ff", notify("workbench.action.quickOpen"), { silent = true })   -- use ripgrep to search files
vim.keymap.set("n", "<Leader>fs", notify("workbench.action.findInFiles"), { silent = true }) -- use ripgrep to search files
vim.keymap.set("n", "<Leader>ef", notify("workbench.action.toggleSidebarVisibility"), { silent = true })

-- window management
vim.keymap.set("n", "<leader>sv", notify("workbench.action.splitEditor"), { silent = true })       -- split window vertically
vim.keymap.set("n", "<leader>sh", notify("workbench.action.splitEditorDown"), { silent = true })   -- split window horizontally
vim.keymap.set("n", "<leader>sx", notify("workbench.action.closeActiveEditor"), { silent = true }) -- make split windows equal width & height

-- toggleTerminal
vim.keymap.set("n", "<Leader>tw", notify("workbench.action.terminal.toggleTerminal"), { silent = true }) -- terminal window

-- format
vim.keymap.set("v", "=", v_notify("editor.action.formatSelection"), { silent = true })

-- folding
vim.keymap.set("n", "zr", notify("editor.foldAll"), { silent = true })
vim.keymap.set("n", "zm", notify("editor.unfoldAll"), { silent = true })
vim.keymap.set("n", "za", notify("editor.toggleFold"), { silent = true })

-- harpoon
vim.keymap.set("n", "<Leader>a", notify("vscode-harpoon.addEditor"), { silent = true })
vim.keymap.set("n", "<Leader>e", notify("vscode-harpoon.editEditors"), { silent = true })
vim.keymap.set("n", "<Leader>p", notify("vscode-harpoon.editorQuickPick"), { silent = true })
vim.keymap.set("n", "<Leader>1", notify("vscode-harpoon.gotoEditor1"), { silent = true })
vim.keymap.set("n", "<Leader>2", notify("vscode-harpoon.gotoEditor2"), { silent = true })
vim.keymap.set("n", "<Leader>3", notify("vscode-harpoon.gotoEditor3"), { silent = true })
vim.keymap.set("n", "<Leader>4", notify("vscode-harpoon.gotoEditor4"), { silent = true })
vim.keymap.set("n", "<Leader>5", notify("vscode-harpoon.gotoEditor5"), { silent = true })

-- find and replace
vim.keymap.set("n", "<leader>fr", notify("editor.action.startFindReplaceAction"), { silent = true })


vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("v", "=", "=gv")
vim.keymap.set("n", "==", "==")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('v', '"', 'c""<esc>P')
vim.keymap.set('v', '[', 'c[]<esc>P')
vim.keymap.set('v', '{', 'c{}<esc>P')
vim.keymap.set('v', "'", "c''<esc>P")
vim.keymap.set('v', '`', 'c``<esc>P')

vim.keymap.set("n", "<leader><Tab>", function()
	vim.fn["VSCodeNotify"]("workbench.action.quickOpenPreviousEditor")
end, { silent = true })

vim.keymap.set("n", "<leader>ee", function()
	vim.fn.VSCodeNotify('multiCommand.toggleExplorerSidebar')
end, { silent = true })
