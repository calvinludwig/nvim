local M = {
    "akinsho/toggleterm.nvim",
    lazy = false,
}

function M.config()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

    local function lazygit_toggle()
        lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>g", lazygit_toggle, { noremap = true, silent = true })

    require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        direction = "float",
        float_opts = {
            border = "curved",
        },
        winbar = {
            enabled = true,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end,
        },
    })
end

return M
