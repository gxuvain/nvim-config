return {
	"VonHeikemen/ts-enable.nvim",
	config = function()
		vim.g.ts_enable = {
			auto_init = true,
			auto_install = true,
			highlights = true
		}
	end
}
