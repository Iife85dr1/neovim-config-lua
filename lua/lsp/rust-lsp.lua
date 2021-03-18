local cap = require("lsp-configs")

require'lspconfig'.rust_analyzer.setup {
    capabilities = cap.get_cap(),
}


vim.cmd('autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)')
