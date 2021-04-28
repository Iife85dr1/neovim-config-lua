--
-- general settings
require('plugins')
require('theme')
require('settings')

vim.g.rooter_targets = "*.sln,Cargo.toml,.git"

-- lsp
require('lsp')
require('lsp.python-lsp')
require('lsp.rust-lsp')
require('lsp.clangd-lsp')
require('lsp.golang-lsp')
require('lsp.react')
require('lsp.lua-lsp')
require('lsp.csharp')


-- plugssad
require('nv-lspkind')
require('nv-compe')
require('nv-lsptrouble')
require('fzf')

-- require('airline')
require('lsp_status')

-- status bar
require('galaxyline')
-- other
require('vimspector')

-- lang-specific
require('langs.rust')

require('nv-treesitter')

