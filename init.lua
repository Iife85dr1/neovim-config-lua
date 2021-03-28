--
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
require('lsp.react')


-- plugs
require('nv-lspkind')
require('nv-lspsaga')
require('nv-compe')
require('fzf')

-- require('airline')
require('lsp_status')

-- status bar
require('galaxyline')
-- other
require('vimspector')
require('rainbow')

-- lang-specific
require('langs.rust')
