vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'folke/tokyonight.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }

  use 'nvim-treesitter/playground'

  use 'ThePrimeagen/harpoon'
  use 'mbbill/undotree'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Debugging
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
      'nvim-telescope/telescope-dap.nvim',
      'mxsdev/nvim-dap-vscode-js',
    }
  }

  use 'tpope/vim-fugitive'

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'MunifTanjim/prettier.nvim',
    requires = {
      'jose-elias-alvarez/null-ls.nvim'
    }
  }

  use 'HiPhish/nvim-ts-rainbow2'

end)
