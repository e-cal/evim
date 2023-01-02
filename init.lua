dofile(os.getenv("HOME") .. "/.config/nvim/settings.lua")
require("utils")
require("plugins")
require("keymap")
require("vim-settings")
require("functions")
require("auto")
require("colors")

-- LSP
require("lsp")
require("lsp.c")
require("lsp.css")
require("lsp.java")
require("lsp.lsp-installer")
require("lsp.lua")
require("lsp.null-ls")
require("lsp.rust")
require("lsp.python")

if UseTabnine then
	require("plugins.tabnine")
end

-- Plugin configs
require("plugins.autopairs")
require("plugins.barbar")
require("plugins.cmp")
require("plugins.colorizer")
require("plugins.comment")
require("plugins.dashboard")
require("plugins.galaxyline")
require("plugins.gitsigns")

require("plugins.indent-blankline")
require("plugins.lightspeed")
require("plugins.lsp-signature")
require("plugins.markdown-preview")
require("plugins.navigator")
require("plugins.nvim-dap")

require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.ultisnips")
require("plugins.whichkey")
