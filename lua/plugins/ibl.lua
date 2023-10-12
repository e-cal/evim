vim.cmd(string.format([[highlight IBLChar guifg=%s gui=nocombine]], Utils.get_hl("ColorColumn", "bg")))
vim.cmd(
	string.format(
		[[highlight IBLScope guifg=%s gui=nocombine]],
		Utils.brightness_modifier(Utils.get_hl("IBLChar", "fg"), 50)
	)
)

require("ibl").setup({
	enabled = IndentGuide,
	debounce = 200,
	viewport_buffer = { min = 30, max = 500 },
	indent = { char = "▎", highlight = "IBLChar", smart_indent_cap = true },
	whitespace = { remove_blankline_trail = true },
	scope = { enabled = true, highlight = "IBLScope", injected_languages = true },
})
