vim.g.rustfmt_autosave=true
vim.g.rustfmt_fail_silently=true
vim.g.rustfmt_rust_clip_command='xclip -selection clipboard'
vim.cmd("au Filetype rust set colorcolumn=100")
vim.api.nvim_set_keymap('n', '<F1>',  ':Crun<CR>G', { })

vim.g.cargo_shell_command_create_buffer='vnew'
vim.g.cargo_one_buffer=1
