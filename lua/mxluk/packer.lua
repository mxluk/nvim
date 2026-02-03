-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      vim.cmd('TSUpdate')
      -- Install core parsers
      local parsers = { 'javascript', 'typescript', 'lua', 'vim', 'vimdoc', 'query', 'c' }
      for _, parser in ipairs(parsers) do
        vim.cmd('TSInstall ' .. parser)
      end
    end
  })

  use('theprimeagen/harpoon')

  use('mbbill/undotree')

  use("tpope/vim-fugitive")

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
		  -- LSP Support
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }
  use("github/copilot.vim")
end)
