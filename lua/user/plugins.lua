local fn = vim.fn

-- Install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Automatically reload neovim when plugin.lua is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Escaping errors in case packer is not installed 
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Open Packer in a Pop-Up Window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Your plugins installed here
return packer.startup(function(use)
  
  -- Packer itself
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Other Plugins
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  -- Plugin Category Here

  -- Colorschemes
  use "lunarvim/darkplus.nvim"
  use("kadekillary/skull-vim")
  use("projekt0n/github-nvim-theme")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
