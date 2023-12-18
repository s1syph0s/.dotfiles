return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		local opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				java = { "google-java-format" },
			},
		}
		require("conform").setup(opts)
	end,
}
