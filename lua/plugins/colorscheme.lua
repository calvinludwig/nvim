local M = {
	enabled = true,
	'jesseleite/nvim-noirbuddy',
	dependencies = { 'tjdevries/colorbuddy.nvim', branch = 'dev' },
	lazy = false,
}

function M.config()
	require('noirbuddy').setup {
		colors = {
			background = Colors.Neutral.bg,
			primary = Colors.Fuchsia[500],
			secondary = Colors.Sky[500],
			noir_0 = Colors.Neutral[50],
			noir_1 = Colors.Neutral[100],
			noir_2 = Colors.Neutral[200],
			noir_3 = Colors.Neutral[300],
			noir_4 = Colors.Neutral[400],
			noir_5 = Colors.Neutral[500],
			noir_6 = Colors.Neutral[600],
			noir_7 = Colors.Neutral[700],
			noir_8 = Colors.Neutral[800],
			noir_9 = Colors.Neutral[900],
			diagnostic_error = Colors.diagnostic.error,
			diagnostic_warning = Colors.diagnostic.warn,
			diagnostic_info = Colors.diagnostic.info,
			diagnostic_hint = Colors.diagnostic.hint,
			diff_add = Colors.git.add,
			diff_change = Colors.git.change,
			diff_delete = Colors.git.delete,
		},
	}

	local Color, colors, Group, groups, styles = require('colorbuddy').setup {}

	Color.new('string', Colors.Emerald[500])
	Color.new('keyword', Colors.Purple[500])

	Group.new('@string', colors.string)
	Group.new('@keyword', colors.keyword)

	Group.new('Searchlight', nil, colors.secondary)

	Group.link('SignifySignAdd', groups.DiffAdd)
	Group.link('SignifySignChange', groups.DiffChange)
	Group.link('SignifySignDelete', groups.DiffDelete)
end

return M
