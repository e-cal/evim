<h1>EVim</h1>

A VSCode-like editing experience in neovim. Sane default setup for a pleasant
drop-in editing experience, and logical configuration to support easy
customization.

Primarily uses lua-based plugins and configuration, with few exceptions,
along with native LSP for a blazingly fast editing experience.

**Requires neovim 0.5.0 or greater.**

<details>
<summary>Screenshots</summary>

![dashboard](https://user-images.githubusercontent.com/47398876/116168679-ff34f080-a6d0-11eb-918f-3d6db514d63b.png)

![VSCode Colors](https://user-images.githubusercontent.com/47398876/116168709-11169380-a6d1-11eb-94ed-824fcb3202a9.png)

![errors](https://user-images.githubusercontent.com/47398876/116168721-183da180-a6d1-11eb-9719-34d158643da0.png)

![full](https://user-images.githubusercontent.com/47398876/116168725-1a9ffb80-a6d1-11eb-8dbb-87189b425a1a.png)

![whichkey](https://user-images.githubusercontent.com/47398876/116168730-1bd12880-a6d1-11eb-903d-72639ed2d029.png)

</details>

> Inspired by [LunarVim](https://github.com/ChristianChiarulli/LunarVim) and [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles/tree/master/nvim/.config/nvim)

---

<!-- [[toc]] -->

- [Installation](#install)
- [Features](#features)
- [Configuration](#config)
- [Default Keymap](#keys)
- [Colorschemes](#colors)
- [Plugins](#plugins)

---

## Installation <a name="install"></a>

1. Make sure the folder `~/.config/nvim` (or equivalent) doesn't already exist.
   - If you have an old config you don't want to lose:
     `mv ~/.config/nvim ~/.config/nvim.old`
2. Clone this repo: `git clone https://github.com/e-cal/evim ~/.config/nvim`
3. If you don't already have pynvim installed: `pip3 install pynvim`
4. Run `nvim` and do `:PackerInstall`
5. Update with `git fetch` + `git pull`, update plugins with `:PackerSync` (or `:PS` for short)

> Note: in order for symbols to display properly you need a patched font.
> Any font from [here](https://www.nerdfonts.com/font-downloads) will work.

## Features <a name="features"></a>

- Written and configured entirely in lua
- Native LSP
  - Completions, linting, formatting, snippets
  - Easily add LSP for a language with `:LspInstall`
  - Enable/disable auto-formatting with `<leader>-l-F` or `:FormatToggle` (change the default in `settings.lua`)
- Whichkey so you don't need to memorize all the keymappings
- Telescope and nvim-tree for seamless navigation
- Git integration
- Markdown previewing for docs and note-taking (powerful along with telescope
  to search for text in notes)
  - Paste images from your clipboard with `<leader>-i` or `:PasteImg`
- Built in debugger
- Improvement of life features: autopairs, strip end-of-line whitespace, better
  quickfix, sane keymappings, tmux integration, and much more...
- Easily configurable and extensible - Make it your own!

## Configuration <a name="config"></a>

- General settings in `settings.lua`
- Regular keymappings are defined in `lua/keymap.lua`
- Leader-key keymappings in `lua/plugins/whichkey.lua`
- Configure language servers installed through `:LspInstall` in `lua/lsp/lsp-installer`\
  ??? see [here](https://github.com/williamboman/nvim-lsp-installer) for more info
  - Alternatively, you can manually install a language server and add a corresponding file
    `lua/lsp/<language>.lua` (don't forget to `require` it in `init.lua`)\
    ??? see the [nvim lspconfig docs](https://github.com/neovim/nvim-lspconfig) for more detailed instructions
- Add & configure formatters in `lua/lsp/null-ls`
- Add plugins in `lua/plugins/init.lua`\
  ??? install after adding with `:PackerSync`\
  ??? add new plugin config in `lua/plugins/<plugin-name>.lua`\
  ??? `require` new configs in `init.lua`

## Default Keymap <a name="keys"></a>

```
<space> - leader

<C-/> - comment lines (in a direction, <leader>-/ to comment current line)

<M-h> - focus left
<M-j> - focus down
<M-k> - focus up
<M-l> - focus right

<M-TAB> - next buffer

<C-Up> - increase up/down window size
<C-Down> - decrease up/down window size
<C-Right> - increase left/right window size
<C-Left> - decrease left/right window size

K - show hover docs
<C-k> - scroll up hover doc
<C-j> - scroll down hover doc

gd - go to definition
gD - go to declaration
gr - go to references
gi - go to implementation

<C-n> - jump to next diagnostic
<C-p> - jump to prev diagnostic
```

`<C-key>` = Control + key <br>
`<M-key>` = Alt + key

Press the leader key (space by default) to bring up whichkey help menu. <br>
If you can't find what you're looking for here, its probably in there
(or not implemented, in which case open an issue or PR).

## Colorschemes <a name="colors"></a>

You can try out the installed colorschemes with the keymap `<space>-t-c`. To
make the change permanent, change it in `settings.lua`.

Some themes may require some extra tweaking to get things looking the way you
want. The relevant files are `lua/colors.lua`, `lua/plugins/galaxyline.lua`
and `lua/plugins/barbar.lua`.

If you add and tweak a colorscheme, put in a PR!

## Plugins <a name="plugins"></a>

**Plugin manager**

- [packer](https://www.github.com/wbthomason/packer.nvim)

**LSP**

- [nvim-lspconfig](https://www.github.com/neovim/nvim-lspconfig)
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
- [ultisnips](https://www.github.com/SirVer/ultisnips)
- [format.nvim](https://github.com/lukas-reineke/format.nvim)
- [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)

**Completion**

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)\
  ??? + a bunch of extra sources

**Navigation**

- [nvim-tree.lua](https://www.github.com/kyazdani42/nvim-tree.lua)
- [telescope](https://www.github.com/nvim-telescope/telescope.nvim)
- [lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim)
- [Navigator.nvim](https://github.com/numToStr/Navigator.nvim)

**Convenience**

- [which-key](https://www.github.com/folke/which-key.nvim)
- [nvim-autopairs](https://www.github.com/windwp/nvim-autopairs)
- [nvim-comment](https://www.github.com/terrortylor/nvim-comment)
- [nvim-bqf](https://www.github.com/kevinhwang91/nvim-bqf)
- [markdown-preview](https://www.github.com/iamcco/markdown-preview.nvim)
- [nvim-colorizer](https://www.github.com/norcalli/nvim-colorizer.lua)
- [gitsigns](https://www.github.com/lewis6991/gitsigns.nvim)
- [vim-surround](https://www.github.com/tpope/vim-surround)
- [vim-repeat](https://www.github.com/tpope/vim-repeat)
- [nvim-ts-autotag](https://www.github.com/windwp/nvim-ts-autotag)
- [indent-blankline.nvim](https://www.github.com/lukas-reineke/indent-blankline.nvim)

**Debuging**

- [nvim-dap](https://www.github.com/mfussenegger/nvim-dap)
- [nvim-dap-ui](https://www.github.com/rcarriga/nvim-dap-ui)
- [nvim-dap-python](https://www.github.com/mfussenegger/nvim-dap-python)

**Theming**

- [nvim-web-devicons](https://www.github.com/kyazdani42/nvim-web-devicons)
- [galaxyline](https://www.github.com/glepnir/galaxyline.nvim)
- [barbar](https://www.github.com/romgrk/barbar.nvim)
- [nvim-treesitter](https://www.github.com/nvim-treesitter/nvim-treesitter)
- [dashboard-nvim](https://www.github.com/glepnir/dashboard-nvim)
- [nvim-deus](https://www.github.com/theniceboy/nvim-deus)
- [nord-vim](https://www.github.com/arcticicestudio/nord-vim)
- [vim-two-firewatch](https://www.github.com/rakr/vim-two-firewatch)
- [edge](https://www.github.com/sainnhe/edge)
- [sonokai](https://www.github.com/sainnhe/sonokai)
- [kanagawa](https://github.com/rebelot/kanagawa.nvim)
