local cap = require("lsp-configs")

require'lspconfig'.jedi_language_server.setup{
    capabilities = cap.get_cap(),
}



