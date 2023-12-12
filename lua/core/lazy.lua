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

require("lazy").setup({
	{ import = "plugins.code" },
	{ import = "plugins.git" },
	{ import = "plugins.lsp" },
	{ import = "plugins.misc" },
	{ import = "plugins.navigation" },
	{ import = "plugins.ui" },

	checker = {
		notify = false, -- get a notification when new updates are found
	},

	change_detection = {
		notify = false,
	},
})
