local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Map leader (required before lazy setup)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

return require('lazy').setup({
  'navarasu/onedark.nvim',
  'nvim-lualine/lualine.nvim',

  'ibhagwan/fzf-lua',

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'mbbill/undotree',
  'tpope/vim-fugitive',

  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},

      {'j-hui/fidget.nvim', tag = 'legacy'},
    }
  },
  'numToStr/Comment.nvim',
  'breuckelen/vim-resize',
  'nvim-tree/nvim-tree.lua',
  'unblevable/quick-scope',
})

