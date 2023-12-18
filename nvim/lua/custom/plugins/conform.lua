return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		local opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
			},
		}
		require("conform").setup(opts)
	end,
}
