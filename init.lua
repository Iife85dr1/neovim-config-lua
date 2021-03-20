-- general settings
require('plugins')
require('theme')
require('settings')


-- lsp
require('lsp')
require('lsp.python-lsp')
require('lsp.rust-lsp')
require('lsp.clangd-lsp')
require('lsp.golang-lsp')


-- plugs
require('nv-lspkind')
require('nv-lspsaga')
require('nv-compe')
require('fzf')

-- status bar
require('galaxyline')
-- require('airline')
require('lsp-status')

-- other
require('vimspector')

-- lang-specific
require('langs.rust')
-- require('autopair')
