local cap = require("lsp-configs")
local lsp_status = require("lsp-status")
local api = vim.api

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

-- Workaround for Cargo.toml file, because rust-analyzer not attached to .toml buffers
function rust_reload_workspace()
    local directory = api.nvim_eval("expand('%:p:h')")
    local lsp_list = vim.lsp.get_active_clients()
    for i=1, table.getn(lsp_list) do
        for iFolder=1, table.getn(lsp_list[i].workspaceFolders) do
            if lsp_list[i].name == "rust_analyzer" and lsp_list[i].workspaceFolders[iFolder].name == directory then
                lsp_list[i].request('rust-analyzer/reloadWorkspace', nil,
                function(err, _, result, _)
                    if err then error(tostring(err)) end
                    vim.notify("[Workspace reloaded]: " .. directory)
                end)
            end
        end
    end
end

vim.cmd('autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre Cargo.toml lua rust_reload_workspace()')
vim.cmd('autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require\'lsp_extensions\'.inlay_hints{ prefix = " > ", highlight = "Comment", enabled = {"TypeHint", "ChainingHint"}}')
