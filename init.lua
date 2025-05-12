if not vim.g.vscode then
  require("willsedgar.core")
  require("willsedgar.lazy")
  vim.cmd("colorscheme habamax")
else
  require("vscode_keymaps")
  vim.cmd [[source $HOME/.config/nvim/vscode/settings.vim]]
end
