-- TODO --
-- filetype on
-- filetype plugin indent on
-- syntax on

vim.cmd("packadd completion-nvim")
vim.cmd("packadd diagnostic-nvim")
vim.cmd("packadd emmet-vim") -- Emmet
vim.cmd("packadd fzf.vim")
vim.cmd("packadd nvim-lspconfig")
vim.cmd("packadd pandoc-preview.vim")
vim.cmd("packadd vim-abolish") -- camelCase to snake_case
vim.cmd("packadd vim-coloresque")
vim.cmd("packadd vim-commentary") -- commentary
vim.cmd("packadd vim-easymotion") -- EasyMotion
vim.cmd("packadd vim-fugitive") -- Vim fugitive
vim.cmd("packadd vim-gitgutter")
vim.cmd("packadd vim-grammarous")
vim.cmd("packadd vim-polyglot") -- languages
vim.cmd("packadd vim-smoothie")
vim.cmd("packadd vim-snippets") -- Snippets
vim.cmd("packadd vim-startify") -- Startify
vim.cmd("packadd vim-table-mode") -- Tables!
vim.cmd("packadd wpgtk.vim")

require("options")
require("keys")
