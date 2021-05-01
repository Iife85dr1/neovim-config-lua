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
    -- LSP COMPLECTION ICONS
    use 'onsails/lspkind-nvim'

    use 'nvim-lua/lsp_extensions.nvim'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'honza/vim-snippets'

	--fzf
	use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use {'junegunn/fzf.vim'}

    -- Other
    use 'ghifarit53/tokyonight-vim'
    use 'airblade/vim-rooter'
    use 'puuuuh/rust.vim'
    use 'puremourning/vimspector'

    -- TS react
    use 'pangloss/vim-javascript'
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'jparise/vim-graphql'

    -- highlight
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} 
    use 'p00f/nvim-ts-rainbow'

    -- Status line
	--use {
	--	'hoob3rt/lualine.nvim',
	--	requires = {'kyazdani42/nvim-web-devicons', opt = true},
	---}
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

    use 'puuuuh/compe-crates'
	-- brackets
	-- use 'windwp/nvim-autopairs'
    -- use 'liuchengxu/vim-which-key'
    -- use 'puremourning/vimspector'

end)
