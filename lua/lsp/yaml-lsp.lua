local cap = require("lsp-configs")
require'lspconfig'.yamlls.setup{
    capabilities = cap.get_cap(),
}
