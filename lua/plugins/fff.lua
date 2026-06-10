return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	config = function()
		require("fff").setup({
			debug = {
				enabled = true,
				show_scores = true,
			},
			layout = {
				prompt_position = "top",
			},
			prompt = "🛸 "
		})
	end,
	keys = {
		{ "<leader>ff", function() require("fff").find_files() end, desc = "FFFind files" },
		{ "<leader>fg", function() require("fff").live_grep() end,  desc = "LiFFFe grep" },
	},
}
