return {
	"mason-org/mason.nvim",
	dependencies = {
		{
			"mason-org/mason-lspconfig.nvim"
		}
	},
	config = function()
		local servers = {
			"lua_ls",
			"ts_ls",
			"oxlint",
			"jsonls",
			"ocamllsp",
			"tailwindcss"
		}
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = servers
		})
	end
}
