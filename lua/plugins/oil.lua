return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},
		})
		vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
	end
}
