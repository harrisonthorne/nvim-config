local lspconfig = require'lspconfig'

local lsp_status = require('lsp-status')
lsp_status.config {
    indicator_errors = ' X',
    indicator_warnings = ' !',
    indicator_info = ' i',
    indicator_hint = ' h',
    indicator_ok = '',
    status_symbol = '',
}
lsp_status.register_progress()

function on_lsp_attach(client)
    require'completion'.on_attach(client)
    lsp_status.on_attach(client)
end

-- Enable language servers

lspconfig.rust_analyzer.setup {
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
    },
    capabilities = lsp_status.capabilities
}

lspconfig.ccls.setup {
    on_attach = on_lsp_attach
}

lspconfig.pyls.setup {
    on_attach = on_lsp_attach
}

lspconfig.kotlin_language_server.setup {
    on_attach = on_lsp_attach
}

vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

