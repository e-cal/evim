vim.go.t_Co = "256"
vim.go.termguicolors = true
vim.go.background = "dark"
vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
vim.cmd("let g:deus_termcolors=256")

vim.cmd("colorscheme " .. Colorscheme)

-- vim.cmd('hi Cursor guibg=#EBDBB2')
-- vim.cmd('set guicursor=n-v:block-Cursor')
-- vim.cmd('hi iCursor guibg=#EBDBB2')
-- vim.cmd('set guicursor+=i-c:ver100-iCursor')
-- vim.cmd('set guicursor+=r:hor10-iCursor')
-- vim.cmd('hi oCursor guibg=#E5C07B')
-- vim.cmd('set guicursor+=o:block-oCursor')

vim.cmd("hi Visual guibg=#E5C07B guifg=black gui=none")

if Colorscheme == "deus" then
	vim.cmd("hi MatchParen cterm=bold guifg=#F4852B guibg=#5C5C5C")
	vim.cmd("hi ColorColumn guibg=#343B46")
	vim.cmd("hi GitSignsChange guifg=#E5C07B")
	vim.cmd("hi BufferCurrentSign guifg=#90C966")
	vim.cmd("hi BufferVisibleSign guifg=#73BA9F")
	vim.cmd("hi BufferInactiveSign guifg=#83A598")
elseif Colorscheme == "two-firewatch" then
	vim.cmd("hi GitSignsChange guifg=#E5C07B")
	vim.cmd("hi SignColumn guibg=#282C34")
	vim.cmd("hi BufferCurrentSign guifg=#90C966")
	vim.cmd("hi BufferVisibleSign guifg=#73BA9F")
	vim.cmd("hi BufferInactiveSign guifg=#83A598")
elseif Colorscheme == "edge" then
	vim.cmd("hi MatchParen cterm=bold guifg=#6cb6eb guibg=#5C5C5C")
	vim.cmd("hi GitSignsChange guifg=#E5C07B")
	vim.cmd("hi BufferVisible guifg=#7f8490 guibg=#33353f")
	vim.cmd("hi BufferVisibleSign guifg=#7f8490 guibg=#33353f")
	vim.cmd("hi BufferVisibleIndex guifg=#7f8490 guibg=#33353f")
	vim.cmd("hi BufferVisibleMod guifg=#deb974 guibg=#33353f")

	vim.cmd("hi VirtualTextError guifg=#ec7279")
	vim.cmd("hi ErrorText guisp=#ec7279")
	vim.cmd("hi VirtualTextWarning guifg=#deb974")
	vim.cmd("hi VirtualTextInfo guifg=#6cb6eb")
	vim.cmd("hi VirtualTextHint guifg=#a0c980")
elseif Colorscheme == "palenightfall" then
	require("palenightfall").setup({
		highlight_overrides = {
			Normal = { bg = "#292D3E" },
			Visual = { bg = "#E5C07B", fg = "black" },
		},
	})
end
