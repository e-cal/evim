vim.cmd('luafile ~/.config/nvim/settings.lua')
require('utils')
require('plugins')
require('keymap')
require('vim-settings')
require('functions')
require('auto')
require('colors')

-- LSP
require('lsp')
require('lsp.bash')
require('lsp.css')
require('lsp.js-ts')
require('lsp.json')
require('lsp.latex')
require('lsp.lua')
require('lsp.rust')
require('lsp.vim')

if Python.useKite then
    require('lsp.kite')
else
    require('lsp.python')
end

require('lsp.efm')

-- Plugin configs
require('plugins.autopairs')
require('plugins.barbar')
require('plugins.colorizer')
require('plugins.comment')
require('plugins.compe')
require('plugins.dashboard')
require('plugins.doge')
require('plugins.galaxyline')
require('plugins.gitsigns')
require('plugins.indent-blankline')
require('plugins.markdown-preview')
require('plugins.nvim-dap')
require('plugins.nvim-tree')
require('plugins.sniprun')
require('plugins.telescope')
require('plugins.toggleterm')
require('plugins.treesitter')
require('plugins.ultisnips')
require('plugins.whichkey')

