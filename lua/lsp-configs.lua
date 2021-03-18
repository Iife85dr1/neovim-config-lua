local confmodule = {}

function confmodule.get_cap()
    cap = vim.lsp.protocol.make_client_capabilities()
    cap.textDocument.completion.completionItem.snippetSupport = true
    return cap
end

return confmodule
