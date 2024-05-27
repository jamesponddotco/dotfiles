local fn = vim.fn
local packer_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(packer_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path})
  vim.api.nvim_command 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use ({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require('plugins.config.treesitter')
    end,
  })

  use ({
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('plugins.config.treesitter-context')
    end,
  })

  use ({
    'Mofiqul/adwaita.nvim',
    config = function()
      vim.cmd([[colorscheme adwaita]])
    end,
  })

  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      'onsails/lspkind.nvim',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require('plugins.config.lsp-cmp')
      require('plugins.config.luasnip')
      require('lsp_lines').setup()
      vim.diagnostic.config({ virtual_text = false })
    end,
  })

  use ({
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.config.lspconfig')
    end,
  })

  use ({
    'mfussenegger/nvim-lint',
    config = function()
      require('plugins.config.lint')
    end,
  })

  use ({
    'folke/trouble.nvim',
    config = function()
      require('plugins.config.trouble')
    end,
  })

  use({
    'Exafunction/codeium.vim',
    config = function()
      require('plugins.config.codeium')
    end,
  })

  use ({
    'nvim-lualine/lualine.nvim',
    require = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    },
    config = function()
      require('plugins.config.lualine')
    end,
  })

  use ({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  })

  use ({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.config.ibl')
    end
  })

  use ({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugins.config.nvim-tree')
    end,
  })

  use ({
    'fatih/vim-go',
    config = function()
      require('plugins.config.go')
    end
  })

  use ({
    'rust-lang/rust.vim',
    config = function()
      require('plugins.config.rust')
    end
  })

  use 'windwp/nvim-ts-autotag'
  use 'lewis6991/impatient.nvim'
  use 'nvim-tree/nvim-web-devicons'
end)
