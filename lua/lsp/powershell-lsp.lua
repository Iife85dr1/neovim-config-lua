local cap = require("lsp-configs")

require'lspconfig'.powershell_es.setup{
    capabilities = cap.get_cap(),
	bundle_path = '/home/user/Coding/powershell/PowerShellEditorServices/',
}


vim.cmd('autocmd BufWritePre *.ps1 lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.psd1 lua vim.lsp.buf.formatting_sync(nil, 100)')
