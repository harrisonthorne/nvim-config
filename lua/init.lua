-- filetype on
-- filetype plugin indent on
-- syntax on

require("options")

vim.g.mapleader = ","

vim.cmd("packadd completion-buffers")
vim.cmd("packadd completion-nvim")
vim.cmd("packadd lsp-status.nvim")
vim.cmd("packadd nvim-lspconfig")
vim.cmd("packadd nvim-treesitter")
vim.cmd("packadd plenary.nvim")
vim.cmd("packadd popup.nvim")
vim.cmd("packadd telescope.nvim")
vim.cmd("packadd vim-commentary") -- commentary
vim.cmd("packadd vim-easymotion") -- easymotion
vim.cmd("packadd vim-fugitive") -- git integration
vim.cmd("packadd vim-gitgutter")
vim.cmd("packadd vim-pandoc") -- pandoc help
vim.cmd("packadd vim-pandoc-syntax") -- pandoc syntax
vim.cmd("packadd vim-polyglot") -- language pack
vim.cmd("packadd vim-smoothie")
vim.cmd("packadd vim-startify") -- start screen
vim.cmd("packadd vim-surround")
vim.cmd("packadd vim-table-mode") -- tables!
vim.cmd("packadd vim-vsnip")
vim.cmd("packadd vim-vsnip-integ")
vim.cmd("packadd wpgtk.vim")

require("lsp")
require("treesitter")
require("keys")
