return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ignore_install = { "help" }
		end,
	},
	-- {
	-- 	"lewis6991/impatient.nvim",
	-- },
}
