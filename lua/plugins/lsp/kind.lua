local M = {}

M.icons = {
    Class = ' ',
    Color = ' ',
    Constant = ' ',
    Constructor = ' ',
    Enum = '了 ',
    EnumMember = ' ',
    Field = ' ',
    File = ' ',
    Folder = ' ',
    Function = ' ',
    Interface = 'ﰮ ',
    Keyword = ' ',
    Method = 'ƒ ',

    Property = ' ',
    Snippet = '﬌ ',
    Struct = ' ',
    Text = ' ',
    Unit = ' ',
    Value = ' ',
    Variable = ' ',
}

function M.cmp_format()
    return function(entry, vim_item)
        if M.icons[vim_item.kind] then
            vim_item.kind = M.icons[vim_item.kind] .. vim_item.kind
        end

        local item = entry:get_completion_item()

        if item.detail then
            vim_item.menu = item.detail
        end

        return vim_item
    end
end

return M
