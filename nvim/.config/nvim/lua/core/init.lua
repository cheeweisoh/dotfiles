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

require("core.globals")
require("core.options")
require("core.keymaps")
require("core.autocmds")

local opts = {
	defaults = {
		lazy = true,
	},
	rtp = {
		disabled_plugins = {
			"netrw",
			"netrwPlugin",
		}
	},
}

local plugins = "plugins"

require("lazy").setup(plugins, opts)
