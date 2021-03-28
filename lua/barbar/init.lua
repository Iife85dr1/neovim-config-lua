
vim.api.nvim_exec([[
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.maximum_padding = 1
let bufferline.closable = v:false


let g:netrw_bufsettings = 'noma nomod nonu nowrap ro buflisted'
]], true)
