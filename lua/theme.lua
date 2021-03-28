vim.api.nvim_exec([[
function! MyHighlights() abort
    highlight LspDiagnosticsDefaultError guifg=#990000
    highlight LspDiagnosticsDefaultWarning guifg=#8c6c00
    highlight Comment guifg=#5f6d86
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
    augroup END
]], false)

vim.cmd("set termguicolors")
vim.cmd("let g:tokyonight_style = 'night'")
vim.cmd("let g:tokyonight_enable_italic = 1")
vim.cmd("colorscheme tokyonight")
-- vim.cmd('let g:airline_theme = "tokyonight"')
