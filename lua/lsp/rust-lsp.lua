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

function run_tests() 
    local uri = vim.uri_from_bufnr(0)
    local cursor = api.nvim_win_get_cursor(0)
    vim.lsp.buf_request(0, 'rust-analyzer/relatedTests', { 
        textDocument = { uri = uri },
        position = { line = cursor[1] - 1, character = cursor[2] },
    },
        function (err, _, result, _)
            if err then error(tostring(err)) end
            print(result[0])
        end
    )
end

function open_cargo() 
    local uri = vim.uri_from_bufnr(0)
    vim.lsp.buf_request(0, 'experimental/openCargoToml', { textDocument = { uri = uri } },
        function (err, _, result, _)
            if err then error(tostring(err)) end
            api.nvim_command('e '..vim.uri_to_fname(result.uri))
            print(result.uri)
        end
    )
end

-- Workaround for Cargo.toml file, because rust-analyzer not attached to .toml buffers
function rust_reload_workspace()
    local directory = api.nvim_eval("expand('%:p:h')")
    local lsp_list = vim.lsp.get_active_clients()

    for i, lsp in pairs(lsp_list) do
        for ii, folder in pairs(lsp.workspaceFolders) do
            if lsp_list[i].name == "rust_analyzer" and folder.name == directory then
                lsp.request('rust-analyzer/reloadWorkspace', nil,
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
vim.cmd('autocmd BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require\'lsp_extensions\'.inlay_hints{ aligned = true, prefix = " > ", highlight = "InlayHint", enabled = {"TypeHint", "ChainingHint"}}')
