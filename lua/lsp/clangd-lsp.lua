require'lspconfig'.clangd.setup{
	cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--header-insertion=never","--compile-commands-dir=Debug/","--fallback-style=microsoft" }
}

require'lspconfig'.cmake.setup {
    cmd = { "cmake-language-server" },
    filetypes = { "cmake", "CMakeLists.txt" },
}

vim.cmd('autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.cc lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.h lua vim.lsp.buf.formatting_sync(nil, 100)')
