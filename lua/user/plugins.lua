-- This file can be loaded by calling `lua require('plugins')` from your init.vim or `require "plugins"` from your init.lua

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print("Installing packer close and reopen Neovim...")
    vim.cmd [[packadd packer.nvim]]
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins
    -- plugin manager
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- Colorschemes
    use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use "EdenEast/nightfox.nvim"

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- autocompletion
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completionsa
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use "hrsh7th/cmp-nvim-lua"

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use "neovim/nvim-lspconfig" -- LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'
    use "BurntSushi/ripgrep"

    -- treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"

    -- auto pairs
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

    -- comment
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use "numToStr/Comment.nvim" -- Easily comment stuff

    use "aklt/plantuml-syntax" -- plantuml highlight plugin

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
