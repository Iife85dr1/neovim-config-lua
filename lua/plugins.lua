local execute =  vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'nvim-lua/lsp_extensions.nvim'

    -- Autocomplete
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/nvim-compe'
    use 'honza/vim-snippets'

	--fzf
	use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use {'junegunn/fzf.vim'}

    -- Other
    use 'folke/tokyonight.nvim'
 
    use 'airblade/vim-rooter'
    use 'puuuuh/rust.vim'
    use 'puremourning/vimspector'
    use 'mfussenegger/nvim-dap'
    use { "puuuuh/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- TS react
    use 'pangloss/vim-javascript'
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'jparise/vim-graphql'

    -- highlight
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} 
    use 'p00f/nvim-ts-rainbow'

	use {
	   'glepnir/galaxyline.nvim',
		branch = 'main',
		config = function() require'galaxyline/my' end,
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'nvim-lua/lsp-status.nvim'
    use 'Shougo/echodoc.vim'
    use 'puuuuh/vimspector-rust'

    use {
        "folke/lsp-trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    use 'mboughaba/i3config.vim'

    use 'weirongxu/plantuml-previewer.vim'

    use 'tyru/open-browser.vim'

    use 'aklt/plantuml-syntax'

    use 'fatih/vim-go'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'simrat39/rust-tools.nvim'
    use 'nvim-lua/popup.nvim'
	-- brackets
	-- use 'windwp/nvim-autopairs'
    -- use 'liuchengxu/vim-which-key'
    -- use 'puremourning/vimspector'

end)
