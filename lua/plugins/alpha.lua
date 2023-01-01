local M = {
    'goolord/alpha-nvim',
}

function M.config()
    require("alpha").setup(require("alpha.themes.startify").config)

end

return M
