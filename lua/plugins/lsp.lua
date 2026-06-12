return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%uv" } },
					},
				},
			},
		},
		config = function()
			vim.lsp.enable({
				"lua_ls",
				"ts_ls",
				"oxlint",
				"jsonls",
				"ocamllsp",
				"tailwindcss"
			})
			-- vim.diagnostic.config({
			-- 	signs = {
			-- 		text = {
			-- 			[vim.diagnostic.severity.ERROR] = " ",
			-- 			[vim.diagnostic.severity.WARN] = " ",
			-- 			[vim.diagnostic.severity.HINT] = "󰠠 ",
			-- 			[vim.diagnostic.severity.INFO] = " ",
			-- 		}
			-- 	}
			-- })
		end
	}
}
