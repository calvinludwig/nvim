-- stylua: ignore
local keys = {
	{ "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Open Harpoon UI", },
	{ "<leader>hf", function() require("harpoon.mark").add_file() end, desc = "Add file to Harpoon", },
}

for i = 1, 9 do
	table.insert(keys, {
		"<leader>" .. i,
		function()
			require("harpoon.ui").nav_file(i)
		end,
		desc = "Navigate to file " .. i,
	})
end

return {
	"ThePrimeagen/harpoon",
	event = "UiEnter",
	keys = keys,
	opts = {},
}
