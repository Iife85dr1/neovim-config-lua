local cap = require("lsp-configs")
local lsp_status = require("lsp-status")

require'lspconfig'.rust_analyzer.setup {
    capabilities = cap.get_cap(),
    on_attach=lsp_status.on_attach,
    settings = {
      ["rust-analyzer"] = {
          ["cargo-watch"] = {
              ["enable"] = true
          },
          ["cargo"] = {
              ["loadOutDirsFromCheck"] = true
          },
          ["procMacro"] = {
              ["enable"] = true
          },
          ["diagnostics"] = {
              ["enableExperimental"] = true
          },
          ["inlayHints"] = {
              ["typeHintsSeparator"] = "‣ "
          }
      }
    }
}


vim.cmd('autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)')
