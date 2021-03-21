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
    -- LSP UI
    use 'glepnir/lspsaga.nvim'
    -- LSP COMPLECTION ICONS
    use 'onsails/lspkind-nvim'

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
    use 'luochen1990/rainbow'
    use 'tjdevries/colorbuddy.vim'

    -- Status line
	--use {
	--	'hoob3rt/lualine.nvim',
	--	requires = {'kyazdani42/nvim-web-devicons', opt = true},
	---}
	use {
	   'glepnir/galaxyline.nvim',
		branch = 'main',
		-- your statusline
		config = function() require'galaxyline/my' end,
    -- some optional icons
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'nvim-lua/lsp-status.nvim'
	
	-- brackets
	-- use 'windwp/nvim-autopairs'
    -- use 'liuchengxu/vim-which-key'
    -- use 'puremourning/vimspector'

end)

