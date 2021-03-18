local cap = require("lsp-configs")

require'lspconfig'.pyls.setup{
    capabilities = cap.get_cap(),
}



