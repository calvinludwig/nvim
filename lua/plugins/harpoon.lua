return {
	"ThePrimeagen/harpoon",
	lazy = false,
	keys = {
		{
			"<leader>hh",
			"<cmd>Telescope harpoon marks<CR>",
			desc = "Open Harpoon menu",
		},
		{
			"<leader>hf",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add file to Harpoon",
		},
		{
			"<leader>1",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Navigate to file 1",
		},
		{
			"<leader>2",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Navigate to file 2",
		},
		{
			"<leader>3",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Navigate to file 3",
		},
		{
			"<leader>4",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Navigate to file 4",
		},
		{
			"<leader>5",
			function()
				require("harpoon.ui").nav_file(5)
			end,
			desc = "Navigate to file 5",
		},
		{
			"<leader>6",
			function()
				require("harpoon.ui").nav_file(6)
			end,
			desc = "Navigate to file 6",
		},
		{
			"<leader>7",
			function()
				require("harpoon.ui").nav_file(7)
			end,
			desc = "Navigate to file 7",
		},
		{
			"<leader>8",
			function()
				require("harpoon.ui").nav_file(8)
			end,
			desc = "Navigate to file 8",
		},
		{
			"<leader>9",
			function()
				require("harpoon.ui").nav_file(9)
			end,
			desc = "Navigate to file 9",
		},
	},
	opts = {},
}
