local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false
opt.undofile = true
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive
opt.cursorline = true
opt.guicursor = ""
opt.termguicolors = true
opt.background = "dark"             -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"              -- show sign column so that text doesn't shift
opt.backspace = "indent,eol,start"  -- allow backspace on indent, end of line or insert mode start position
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.splitright = true               -- split vertical window to the right
opt.splitbelow = true               -- split horizontal window to the bottom
opt.swapfile = false
opt.foldnestmax = 4
opt.foldlevel = 1
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "expr"
opt.foldlevelstart = 99
opt.foldenable = true
opt.lazyredraw = true
