vim.cmd('nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>')
vim.cmd('nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>')
vim.cmd('nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>')
vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')
vim.cmd('nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>')
vim.cmd('nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>')
vim.cmd('nnoremap <silent> K <cmd>Lspsaga hover_doc<CR>')
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap=true, silent=true})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      spacing = 5,
      prefix = '!! ',
      severity_limit = "Warning",
    },
  }
)



-- vim.lsp.diagnostic.set_loclist()


