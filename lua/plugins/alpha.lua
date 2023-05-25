local M = {
	"goolord/alpha-nvim",
	event = "VimEnter",
}

function M.config()
	require("alpha").setup(require("alpha.themes.startify").config)
end

return M
