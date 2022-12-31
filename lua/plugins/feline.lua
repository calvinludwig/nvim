local M = {
    "feline-nvim/feline.nvim",
}

function M.config()
    local feline = require("feline")
    local clrs = require("catppuccin.palettes").get_palette()
    local ctp_feline = require("catppuccin.groups.integrations.feline")
    local U = require("catppuccin.utils.colors")

    ctp_feline.setup({
        assets = {
            left_separator = "",
            right_separator = "",
            bar = "",
            mode_icon = " ",
        },
    })

    feline.setup({
        components = ctp_feline.get(),
    })
end

return M
