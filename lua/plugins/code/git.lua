return {
	{
		"lewis6991/gitsigns.nvim",

		event = "BufReadPre",

		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
			})
		end,
	},
	{
		"f-person/git-blame.nvim",

		lazy = true,

		opts = {
			enabled = true,
		},
	},
}