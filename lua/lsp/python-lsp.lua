local cap = require("lsp-configs")

require'lspconfig'.pyright.setup{
    capabilities = cap.get_cap(),
}



