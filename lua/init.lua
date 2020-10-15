-- filetype on
-- filetype plugin indent on
-- syntax on

vim.cmd("packadd completion-nvim")
vim.cmd("packadd diagnostic-nvim")
vim.cmd("packadd fzf.vim")
vim.cmd("packadd lsp-status.nvim")
vim.cmd("packadd nvim-lspconfig")
vim.cmd("packadd pandoc-preview.vim")
vim.cmd("packadd vim-abolish") -- camelCase to snake_case
vim.cmd("packadd vim-coloresque")
vim.cmd("packadd vim-commentary") -- commentary
vim.cmd("packadd vim-easymotion") -- EasyMotion
vim.cmd("packadd vim-fugitive") -- Vim fugitive
vim.cmd("packadd vim-gitgutter")
vim.cmd("packadd vim-polyglot") -- languages
vim.cmd("packadd vim-smoothie")
vim.cmd("packadd vim-snippets") -- Snippets
vim.cmd("packadd vim-startify") -- Startify
vim.cmd("packadd vim-table-mode") -- Tables!
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

require("options")
require("keys")
