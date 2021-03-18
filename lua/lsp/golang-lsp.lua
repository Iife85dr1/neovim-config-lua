lspconfig = require "lspconfig"
  lspconfig.gopls.setup {
    cmd = {"gopls","serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	}
  }

vim.cmd('autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)')
