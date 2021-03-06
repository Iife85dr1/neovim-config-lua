vim.o.clipboard='unnamedplus'
vim.o.showmatch=true
vim.cmd('set ts=4')
vim.cmd('set sts=4')
vim.cmd('set sw=4')
vim.o.autoindent=true
vim.o.smartindent=true
vim.o.smarttab=true
vim.o.number=true
vim.o.relativenumber=true
vim.o.smarttab=true
vim.o.et=true
vim.o.wrap=true
vim.o.ai=true
vim.o.cin=true
vim.o.encoding='utf-8'
vim.o.fileencoding='utf-8'
vim.o.hidden=true
-- long line coloring
vim.o.synmaxcol=0

-- tmux
-- vim.o.t_Co='256'
vim.o.bomb=true
vim.o.binary=true
vim.cmd('set backspace=indent,eol,start')
vim.o.tabstop=4

vim.o.termguicolors=true
vim.o.mouse="a"
vim.o.updatetime=500
vim.g.rainbow_active=1

-- netrw
vim.g.netrw_banner=0
vim.g.netrw_liststyle=3
vim.g.netrw_fastbrowse=0


-- vim.cmd('noremap <silent> <S-t> :Explore <CR>')
vim.cmd('noremap <silent> <S-t> <cmd>lua require(\'telescope.builtin\').file_browser() <CR>')

vim.cmd('nnoremap <leader>ff <cmd>lua require(\'telescope.builtin\').find_files() <CR>')
vim.cmd('nnoremap <leader>fg <cmd>lua require(\'telescope.builtin\').live_grep() <CR>')

vim.cmd('nmap <TAB> <cmd>lua require(\'telescope.builtin\').buffers() <CR>')
vim.cmd('xmap <TAB> <cmd>lua require(\'telescope.builtin\').buffers() <CR>')

vim.cmd('noremap . :b# <CR>')
vim.cmd('noremap , :Telescope <CR>')

vim.cmd('set signcolumn=yes')
-- vim.cmd('set autochdir')

vim.cmd("let g:vimspector_enable_mappings = 'HUMAN'")


-- Restart lsp
vim.api.nvim_exec([[
function! RestartLSP()
    :execute 'lua vim.lsp.stop_client(vim.lsp.get_active_clients())'
    :execute 'sleep 1'
    :execute 'edit'
endfunction
command! -nargs=* R call RestartLSP()
]], true)
