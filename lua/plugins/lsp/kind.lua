local M = {}

function M.cmp_format()
	return function(entry, vim_item)
		if Icons.cmp[vim_item.kind] then
			vim_item.kind = Icons.cmp[vim_item.kind] .. vim_item.kind
		end

		local item = entry:get_completion_item()

		if item.detail then
			vim_item.menu = item.detail
		end

		return vim_item
	end
end

return M
