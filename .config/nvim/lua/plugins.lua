 -- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = "require('config.treesitter')",
    run = ':TSUpdate',
    event = 'BufRead',
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = { 'nvim-treesitter' }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim', run = 'make'},
    },
    -- setup = "require('plugin.telescope.mappings')",
    config = "require('config.telescope')",
  }

  use {
    'ibhagwan/fzf-lua',
    requires = {
      { 'vijaymarupudi/nvim-fzf' },
      { 'kyazdani42/nvim-web-devicons' },
    },
    setup = "require('config.fzf-lua.keymaps')",
    config = "require('config.fzf-lua')",
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('config.nvim-tree')",
    -- cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
  }

  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  -- Autocompletion
  use {
    'hrsh7th/nvim-compe',
    config = "require('config.completion')"
  }
  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Everforest
  use 'sainnhe/everforest'

  -- Add git related info in the signs columns and popups
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('config.gitsigns')",
    after = 'plenary.nvim'
  }

  -- Lualine
  use {
    'hoob3rt/lualine.nvim',
    config = "require('config.lualine')",
  }

  -- plenary is required by gitsigns and telescope
  -- lazy load so gitsigns doesn't abuse our startup time
  -- use { 'nvim-lua/plenary.nvim', event = 'BufRead' }

  -- optional for fzf-lua, telescope, nvim-tree, feline
  use { 'kyazdani42/nvim-web-devicons', event = 'VimEnter' }

  -- Rust tools
  use {
    'simrat39/rust-tools.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('rust-tools').setup({})
    end
  }
end)
