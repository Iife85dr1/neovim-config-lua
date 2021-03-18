require'lspconfig'.rust_analyzer.setup {
}


vim.cmd('autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)')
