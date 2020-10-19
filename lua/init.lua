-- filetype on
-- filetype plugin indent on
-- syntax on

vim.g.mapleader = ","

vim.cmd("packadd completion-nvim")
vim.cmd("packadd completion-buffers")
vim.cmd("packadd completion-treesitter")
vim.cmd("packadd diagnostic-nvim")
vim.cmd("packadd fzf.vim")
vim.cmd("packadd lsp-status.nvim")
vim.cmd("packadd nvim-lspconfig")
vim.cmd("packadd nvim-treesitter")
vim.cmd("packadd pandoc-preview.vim")
vim.cmd("packadd vim-commentary") -- commentary
vim.cmd("packadd vim-easymotion") -- easymotion
vim.cmd("packadd vim-fugitive") -- git integration
vim.cmd("packadd vim-gitgutter")
vim.cmd("packadd vim-polyglot") -- language pack
vim.cmd("packadd vim-smoothie")
vim.cmd("packadd vim-startify") -- start screen
vim.cmd("packadd vim-table-mode") -- tables!
vim.cmd("packadd wpgtk.vim")

local nvim_lsp = require'nvim_lsp'
local lsp_status = require('lsp-status')
lsp_status.register_progress()

function on_lsp_attach(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
    lsp_status.on_attach(client)
end

-- Enable language servers
nvim_lsp.rust_analyzer.setup {
    on_attach = on_lsp_attach,
    settings = {
        ["rust-analyzer"] = {
            updates = { channel = "stable" },
            notifications = { cargoTomlNotFound = false },
            checkOnSave = { 
                command = "clippy",
                extraArgs = "--tests",
            },
            callInfo = { full = true },
            inlayHints = { chainingHints = true },
        }
    }
}

vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
}

require("options")
require("keys")
